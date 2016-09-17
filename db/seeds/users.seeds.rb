puts "==== Create Users ===="
  User.destroy_all
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE users_id_seq RESTART WITH 1"
  )

  image_path = "#{Rails.root}/app/assets/images"

  User.create!([
    {
      name: 'Admin',
      email: 'admin@example.com',
      password: '123123123',
      role: :admin,
      description: 'Peter is regarded as one of the most respected attorneys in not only the state of New York, but entire country, because of his long list of achievements and successful cases.',
      picture: File.open("#{image_path}/users/picture/medium/missing.jpg"),
    }
  ])

puts "==== End ===="
