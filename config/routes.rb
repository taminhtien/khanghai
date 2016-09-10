Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  resources :services, only: [:index, :show]
  resources :contacts, only: [:new, :create]
  resources :posts, only: [:index, :show]
  resources :categories, only: [:show]

  get '/about-us' => 'pages#about_us', as: 'about_us'
  get '/contact-us' => 'contacts#new', as: 'contact_us'
end
