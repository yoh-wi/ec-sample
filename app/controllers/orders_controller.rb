class OrdersController < ApplicationController
  before_action :move_to_index
  
  def index
    @orders = Order.where(user_id: current_user.id)
  end
  
  def show
  end

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
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to user_orders_path(current_user)
  end

  private
  
  def order_params
    params.require(:order).permit(:username, :orderitems).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
