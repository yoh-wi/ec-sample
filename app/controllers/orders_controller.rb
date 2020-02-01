class OrdersController < ApplicationController

  def new
    @cart_id = session[:cart_id]
    @cart = Orderitem.where(cart_id: @cart_id)
  end

  def create
    @cart_id = session[:cart_id]
    @cart = Orderitem.where(cart_id: @cart_id)
    @order = Order.new(params[:order])
    @order.add_orderitems_from_cart(@cart)
  end

  private
  
  def order_params
    params.require(:orders).permit(:orderitems)
  end

  def add_orderitems_from_cart(cart)
    cart.orderitems.each do |item|
      orderitems << item
    end
  end

end
