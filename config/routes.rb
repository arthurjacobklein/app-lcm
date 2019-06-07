Rails.application.routes.draw do



  get 'admins/new'
  get 'admins/create'
  get 'admins/show'
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

  resources :home, only: [:index]
  resources :users, only: [:create]

  root to: 'home#index'
  devise_for :user
  resources :user do
    resources :profile_pictures, only: [:create]
  end
  resources :products 
  resources :order_items
  resources :cart, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


