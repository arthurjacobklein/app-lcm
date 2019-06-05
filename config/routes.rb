Rails.application.routes.draw do


  get 'home/index'
  root to: 'home#index'
  resources :home, only: [:index]
  resources :products
  resources :order_items
  resources :cart, only: [:show]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
