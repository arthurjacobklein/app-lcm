Rails.application.routes.draw do


  resources :admins, only: [:new, :create, :show]
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

  resources :charges
  resources :home, only: [:index]
  resources :users, only: [:create]
  root to: 'products#index'
  resources :products
  resources :order_items
  resources :cart, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
