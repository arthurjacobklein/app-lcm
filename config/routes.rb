Rails.application.routes.draw do


  resources :home, only: [:index]
  resources :users, only: [:create]
  root to: 'products#index'
  resources :products
  resources :order_items
  resources :cart, only: [:show]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
