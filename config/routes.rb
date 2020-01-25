Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items

  post '/cartitems', to: 'carts#create'
end
