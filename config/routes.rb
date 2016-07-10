Rails.application.routes.draw do
  root 'home#coming_soon'
  get '/index', to: 'home#index'
  resource :our_services
end
