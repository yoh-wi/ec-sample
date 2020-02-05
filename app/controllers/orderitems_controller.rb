class OrderitemsController < ApplicationController
  before_action :move_to_index, only: [:show, :create, :destroy]

  def index
    @order = Order.find(params[:order_id])
    @orderitems = Orderitem.where(order_id: params[:order_id])
  end

  def create
    current_cart
    # @cart_id = session[:cart_id]
    @orderitem = Orderitem.create(orderitem_params)
    redirect_back fallback_location: { action: "items" }, notice: 'カートに追加しました。'
  end

  def destroy
    @cart_id = session[:cart_id]
    # @cart = Orderitem.where(cart_id: @cart_id)
    Orderitem.where(cart_id: @cart_id).destroy_all
    redirect_back fallback_location: { action: root_path }
  end

  private

  def orderitem_params
    params.permit(:itemcode, :itemname, :itemprice, :quantity, :item_id).merge(cart_id: current_cart)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end