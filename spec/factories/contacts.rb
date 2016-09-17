FactoryGirl.define do
  factory :contact do
    first_name 'Tom'
    last_name 'Ta'
    email 'tom@gmail.com'
    phone_number '01675166477'
    subject 'Contact message'
    message 'Bla Bla'
  end
end