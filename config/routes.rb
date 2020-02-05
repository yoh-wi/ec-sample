Rails.application.routes.draw do
  devise_for :users 
  root to: 'items#index'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :orders do
      resources :orderitems, only: :index
    end
  end
  namespace :adm do
    resources :users do
      resources :orders
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :categories
  resources :items do
    collection do
      get 'search'
    end
  end
  
  
  post 'orders', to: 'orders#create'
  post 'cartitems', to: 'orderitems#create'
  delete 'cartdelete', to: 'orderitems#destroy'
  # get '/cateindex', to: 'categories#cateindex'
  # post '/cartitems', to: 'carts#create'

end
