class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def current_cart
    if session[:cart_id]
      @cart_id = session[:cart_id]
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      @cart_id = session[:cart_id]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :telenumber])
  end
end 
  
  
  # def cart_create
  #   cartin_item = {n: cart_params[:name], p: cart_params[:price], q: cart_params[:quantity]}.stringify_keys
  #   if session[:cartitems]
  #     session[:cartitems] << cartin_item
  #   else
  #     session[:cartitems] = []
  #     session[:cartitems] << cartin_item
  #   end
    # @cart = session[:cartitems]
  # end

  # def add_orderitems_from_cart(cart)

  #   cart.orderitems.each do |item|
  #     orderitems << item
  #   end
  # end