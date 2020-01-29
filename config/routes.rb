Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :categories
  resources :items do
    collection do
      get 'search'
    end
  end
  # get '/cateindex', to: 'categories#cateindex'
  post '/cartitems', to: 'carts#create'
end
