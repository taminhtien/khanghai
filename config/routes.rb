Rails.application.routes.draw do
  root 'home#index'
  resource :our_services
end
