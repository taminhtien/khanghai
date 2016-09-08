Rails.application.routes.draw do
  root 'home#index'

  resources :services, only: [:index, :show]
end
