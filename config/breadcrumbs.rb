crumb :root do
  link 'Khang Hai', root_path
end

crumb :services do
  link 'Our Services', services_path
end

crumb :service do |service|
  link service.title, service
  parent :services
end