Rails.application.routes.draw do


  root to: 'products#index'
  devise_for :user
  resources :user do
    resources :profile_pictures, only: [:create]
  end
  resources :products
  resources :order_items
  resources :cart, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
