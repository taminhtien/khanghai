class AddJobTitleAndSalutationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :salutation, :string
  end
end
