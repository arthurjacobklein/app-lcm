Rails.application.routes.draw do

  get 'contacts/create'
  get 'contacts/new'
  get 'contacts/create'
  resources :about, only: [:index]
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :admin do
      resources :brands
      resources :users
      resources :accounts
      resources :orders
      resources :order_items
      resources :products

      root to: "brands#index"
    end
  devise_for :brands
  resources :brands do
    resources :products
  end 

  namespace :user do
    root :to => "products#index"
  end

  resources :home, only: [:index]

  root to: 'home#index'

  devise_for :users
  resources :users do
    resources :profile_pictures, only: [:create]
  end


  get "/contact_us", to: "static_pages#contact_us"
  get "/about_us", to: "static_pages#about_us"
  


  resources :products
  resources :order_items
  resources :cart, only: [:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

