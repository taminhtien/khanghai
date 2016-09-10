crumb :root do
  link 'Khang Hai', root_path
end

crumb :services do
  link 'Our Services', services_path
end

crumb :posts do
  link 'Posts', posts_path
end

crumb :about_us do
  link 'About us', about_us_path
end

crumb :contact_us do
  link 'Contact us', contact_us_path
end

crumb :service do |service|
  link service.title, service
  parent :services
end

crumb :post do |post|
  link post.title, post
  parent :posts
end