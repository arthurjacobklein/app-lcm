Rails.application.routes.draw do



  devise_for :brands

  resources :home, only: [:index]
  resources :users, only: [:create]

  root to: 'products#index'
  devise_for :user
  resources :user do
    resources :profile_pictures, only: [:create]
  end

  resources :products 
  resources :order_items
  resources :cart, only: [:show]

  get "/contact_us", to: "static_pages#contact_us"
  get "/about_us", to: "static_pages#about_us"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



