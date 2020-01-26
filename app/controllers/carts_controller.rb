class CartsController < ApplicationController
  def create
    cart_create
    @cart = session[:cartitems]
    redirect_back fallback_location: { action: "items" }, notice: 'カートに追加しました。'
  end

  # def cart_params
  #   params.permit(:code, :name, :price, :quantity)
  # end
end