require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

app           = 'khanghai'
ruby_version  = 'ruby-2.3.0'
ruby_gemset   = 'khanghai'

stage         = ENV['to'] || 'staging'

case stage
  when 'production'
    domain = '120.72.98.163'
    user   = 'khanghai'
    branch = 'master'
  else
    print_error "Please specify a stage. eg. mina deploy to=production"
    exit
end

set :app, app
set :domain, domain
set :user, user
set :rails_env, stage
set :deploy_to, "/home/#{user}/#{stage}"
set :term_mode, nil
set :shared_paths, ['config/database.yml', 'log', 'tmp', 'public/system', 'public/ckeditor_assets']
set :rvm_path, "/home/#{user}/.rvm/scripts/rvm"
set :repository, "ssh://#{user}@localhost/~/git/#{app}.git"

queue %[source ~/.bashrc]

task :environment do
  set :branch, branch
  invoke :"rvm:use[#{ruby_version}@#{ruby_gemset}]"
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]

  queue! %[mkdir -p "#{deploy_to}/shared/files"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/files"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]

  queue %[bundle config build.pg --with-pg-config=/usr/bin/pg_config]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    
    # invoke :clear_scheduler
    # invoke :exec_scheduler

    to :launch do
      invoke :'puma:restart'
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
    end
  end
end

desc "Seed data to the database"
task :seed => :environment do
  queue "cd /home/khanghai/production/current"
  queue "bundle exec rake db:seed RAILS_ENV=production"
end

desc "Logs"
task :logs do
  queue 'echo "Contents of the log file are as follows:"'
  queue "tail -200f #{stage}/shared/log/#{stage}.log"
end

desc "Rolls back the latest release"
task :rollback => :environment do
    queue %[echo "-----> Rolling back to previous release for instance: #{domain}"]

    # ls command below must return two rows. first of the two contains the 2nd latest version.
    queue! %[last=`ls "#{deploy_to}/releases" -Art | sort -n | tail -n 2 | sed -n '1p'`]
    queue! %[current=`ls "#{deploy_to}/releases" -Art | sort -n | tail -n 2 | sed -n '2p'`]

    # sanity check: are both versions actual numbers? is the target folder available?
    queue! %[
        if [ ! -n "$last" ] || [ ! -n "$current" ] || [ ! -d "#{deploy_to}/releases/$last" ];
        then
            echo "ERROR: No version to roll back to!";
            exit 1;
        fi
      ]

    queue %[echo "Moving from $current to $last"]

    # remove latest release folder (active release)
    queue! %[ls "#{deploy_to}/releases" -Art | sort -n | tail -n 1 | xargs -I active rm -rf "#{deploy_to}/releases/active"]

    # delete existing sym link and create a new symlink pointing to the previous release
    queue! %[rm "#{deploy_to}/current"]
    queue! %[ls -Art "#{deploy_to}/releases" | sort -n | tail -n 1 | xargs -I active ln -s "#{deploy_to}/releases/active" "#{deploy_to}/current"]
end

namespace :puma do
  set :web_server, :puma

  set_default :puma_role,      -> { user }
  set_default :puma_env,       -> { fetch(:rails_env, 'production') }
  # set_default :puma_config,    -> { "#{deploy_to}/current/config/puma.rb" }
  set_default :puma_socket,    -> { "#{deploy_to}/shared/tmp/#{app}.sock" }
  set_default :puma_state,     -> { "#{deploy_to}/shared/tmp/#{app}.state" }
  set_default :puma_pid,       -> { "#{deploy_to}/shared/tmp/#{app}.pid" }
  set_default :puma_cmd,       -> { "#{bundle_prefix} puma" }
  set_default :pumactl_cmd,    -> { "#{bundle_prefix} pumactl" }
  set_default :pumactl_socket, -> { "#{deploy_to}/shared/tmp/#{app}_ctl.sock" }

  desc 'Start puma'
  task :start => :environment do
    queue! %[
      if [ -e '#{pumactl_socket}' ]; then
        echo 'Puma is already running!';
      else
        cd #{deploy_to}/#{current_path} && #{puma_cmd} -q -d -e #{puma_env} -b 'unix://#{puma_socket}' -S #{puma_state} --pidfile #{puma_pid} --control 'unix://#{pumactl_socket}'
      fi
    ]
  end

  desc 'Stop puma'
  task stop: :environment do
    queue! %[
      if [ -e '#{pumactl_socket}' ]; then
        cd #{deploy_to}/#{current_path} && #{pumactl_cmd} -S #{puma_state} stop
        rm -f '#{pumactl_socket}'
      else
        echo 'Puma is not running!';
      fi
    ]
  end

  desc 'Status puma'
  task status: :environment do
    queue! %[
      if [ -e '#{puma_pid}' ]; then
        echo "Puma (PID $(cat #{puma_pid})) is running ..."
      else
        echo 'Puma is not running!';
      fi
    ]
  end

  desc 'Restart puma'
  task restart: :environment do
    invoke :'puma:stop'
    invoke :'puma:start'
  end
end

namespace :nginx do
 %w(stop start restart reload status).each do |action|
   desc "#{action.capitalize} Nginx"
   task action.to_sym => :environment do
     queue  %(echo "-----> #{action.capitalize} Nginx")
     queue "sudo service nginx #{action}"
   end
 end
end

desc "Clear scheduler"
task :clear_scheduler => :environment do
  queue "bundle exec whenever --clear-crontab cheap_flight --set 'environment=#{rails_env}&path=#{deploy_to}/current/'"
  queue  %[echo "-----> Clear Scheduler Completed."]
end

desc "Invoke scheduler"
task :exec_scheduler => :environment do
  queue "bundle exec whenever --update-crontab cheap_flight --set 'environment=#{rails_env}&path=#{deploy_to}/current/'"
  queue  %[echo "-----> Add Scheduler Completed."]
end
