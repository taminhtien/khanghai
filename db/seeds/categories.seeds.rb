puts "==== Create Categories ===="
  Category.destroy_all
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE categories_id_seq RESTART WITH 1"
  )

  image_path = "#{Rails.root}/app/assets/images"

  Category.create!([
    { name: 'Bankruptcy Law' },
    { name: 'Civil Rights Law' },
    { name: 'Criminal Law' },
    { name: 'Family Law' },
    { name: 'Legal Advice' },
    { name: 'Legal Issues' },
    { name: 'Startup' },
    { name: 'Uncategorized' }
  ])

puts "==== End ===="
