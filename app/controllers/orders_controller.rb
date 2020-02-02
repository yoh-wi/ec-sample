class OrdersController < ApplicationController

  def new
    if session[:cart_id]
      @cart_id = session[:cart_id]
      @cart = Orderitem.where(cart_id: @cart_id)
    end
      @order = Order.new
  end
  
  def create
    @cart_id = session[:cart_id]
    @cart = Orderitem.where(cart_id: @cart_id)
    @order = Order.create(order_params)
    @cart.update(order_id: @order.id)
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    # @order.add_orderitems_from_cart(current_cart)
    # @order.orderitems.each do |item|
    #   orderitems << item
    # end
  end

  private
  
  def order_params
    params.permit(:username, :orderitems)
  end

  # def add_orderitems_from_cart(cart)
  #   orderitems = []
  #   cart.orderitems.each do |item|
  #     orderitems << item
  #   end
  # end

end
