Rails.application.routes.draw do
  devise_for :users 
  resources :users, only: [:show, :edit, :update] do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :categories
  resources :items do
    collection do
      get 'search'
    end
  end
  
  resources :orderitems
  post 'orders', to: 'orders#create'
  post 'cartitems', to: 'orderitems#create'
  # get '/cateindex', to: 'categories#cateindex'
  # post '/cartitems', to: 'carts#create'

end
