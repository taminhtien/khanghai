FactoryGirl.define do
  factory :user do
    first_name 'Admin'
    last_name 'Ta'
    job_title 'Admin'
    email 'admin@example.com'
    password '123123123'
    role :admin
    description 'Peter is regarded as one of the most respected attorneys in not only the state of New York, but entire country, because of his long list of achievements and successful cases.'
  end
end
