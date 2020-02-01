class OrderitemsController < ApplicationController

  def create
    current_cart
    # @cart_id = session[:cart_id]
    @orderitem = Orderitem.create(orderitem_params)
    redirect_back fallback_location: { action: "items" }, notice: 'カートに追加しました。'
    
  end


  private

  def orderitem_params
    params.permit(:itemcode, :itemname, :itemprice, :quantity, :item_id).merge(cart_id: current_cart)
  end
end