class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def cart_create
    cartin_item = {n: cart_params[:name], p: cart_params[:price], q: cart_params[:quantity]}.stringify_keys
    if session[:cartitems]
      session[:cartitems] << cartin_item
    else
      session[:cartitems] = []
      session[:cartitems] << cartin_item
    end
    # @cart = session[:cartitems]
  end

end
