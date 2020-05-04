class OrderitemsController < ApplicationController
  before_action :move_to_index, only: [:show, :create, :destroy]

  def index
    # @order = Order.find(params[:order_id])
  #   @orderitems = Orderitem.where(order_id: params[:order_id])
    @orderitems = Orderitem.all
  end

  def create
    current_cart
    @orderitem = Orderitem.create(orderitem_params)
    redirect_back fallback_location: { action: "items" }, notice: 'カートに追加しました。'
  end

  def destroy
    @cart_id = session[:cart_id]
    Orderitem.where(cart_id: @cart_id).destroy_all
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_back fallback_location: { action: root_path }
  end

  private

  def orderitem_params
    params.permit(:itemcode, :itemname, :itemprice, :quantity, :item_id).merge(cart_id: current_cart)
  end

  def move_to_index
    unless user_signed_in?
      redirect_back fallback_location: { action: "items" }, notice: 'ログインしてください。'
    end
  end
end