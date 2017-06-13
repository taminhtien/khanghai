crumb :root do
  link t('breadcrumbs.index'), root_path
end

crumb :services do
  link 'Dịch vụ', services_path
end

crumb :posts do
  link 'Bài viết', posts_path
end

crumb :forms do
  link 'Biểu mẫu', forms_path
end

crumb :about_us do
  link 'Về chúng tôi', about_us_path
end

crumb :contact_us do
  link 'Liên hệ với chúng tôi', contact_us_path
end

crumb :service do |service|
  link service.title, service
  parent :services
end

crumb :post do |post|
  link post.title.truncate(100), post_url(post)
  parent :posts
end

crumb :form do |form|
  link form.title.truncate(100), form
  parent :forms
end
