Rails.application.routes.draw do


  root to: 'products#index'
  resources :products
  resources :order_items
  resources :cart, only: [:show]

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
