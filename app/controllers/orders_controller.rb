class OrdersController < ApplicationController
  before_action :move_to_index
  
  def index
    @orders = Order.where(user_id: current_user.id)
  end
  
  def show
    @order = Order.find(params[:id])
    @orderitems = Orderitem.where(order_id: params[:id])
  end

  def new
    if session[:cart_id]
      @cart_id = session[:cart_id]
      @cart = Orderitem.where(cart_id: @cart_id)
      if Card.exists?(user_id: current_user.id)
        card = Card.find_by(user_id: current_user.id)
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_key)
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      else
        redirect_to new_card_path
      end
    end
      @order = Order.new
  end
  
  def create
    @cart_id = session[:cart_id]
    @cart = Orderitem.where(cart_id: @cart_id)
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_key)
    charge = Payjp::Charge.create(
      amount: order_params[:priceSum],
      customer: card.customer_id,
      currency: 'jpy',
      )
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
    params.require(:order).permit(:username, :orderitems, :priceSum).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
