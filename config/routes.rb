Rails.application.routes.draw do
  devise_for :users 
  root to: 'items#index'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :orders
    resources :cards, except: :edit
  end
  resources :orderitems, only: :index
  namespace :adm do
    resources :users
    resources :orders
    resources :orderitems, only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :categories
  resources :items do
    collection do
      get 'search'
    end
  end
  # resources :orders
  # resources :orderitems, only: :index
  
  post 'orders', to: 'orders#create'
  post 'cartitems', to: 'orderitems#create'
  delete 'cartdelete', to: 'orderitems#destroy'
  # get '/cateindex', to: 'categories#cateindex'
  # post '/cartitems', to: 'carts#create'

end
