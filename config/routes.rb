Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  resources :services, only: [:index, :show]
  resources :contacts, only: [:new, :create]
  resources :posts, only: [:index, :show]
  resources :forms, only: [:index, :show]
  resources :new_posts, only: [:index, :show]
  resources :documents, only: [:index, :show]
  resources :qnas, only: [:index, :show]
  resources :categories, only: [:show]

  get '/about-us' => 'pages#about_us', as: 'about_us'
  get '/contact-us' => 'contacts#new', as: 'contact_us'
  get '/coming_soon' => 'home#coming_soon', as: 'coming_soon'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
end
