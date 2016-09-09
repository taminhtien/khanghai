Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  resources :services, only: [:index, :show]

  get '/about-us' => 'pages#about_us', as: 'about_us'
  get '/contact-us' => 'pages#contact_us', as: 'contact_us'
end
