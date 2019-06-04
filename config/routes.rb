Rails.application.routes.draw do


  resources :products
  resources :order_items,
  resource :cart, only: [:show]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
