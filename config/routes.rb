Rails.application.routes.draw do

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
  resources :brands

  resources :home, only: [:index]
  resources :users, only: [:create]

  root to: 'home#index'
<<<<<<< HEAD

  devise_for :users
  resources :users
=======
  devise_for :user
>>>>>>> 3bc278cdafeba0c34b07ec0cf77c5c677338336f
  resources :users do
    resources :profile_pictures, only: [:create]
  end
  resources :products
  resources :order_items
  resources :cart, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
