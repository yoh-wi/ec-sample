class ItemsController < ApplicationController
  before_action :set_category, only: [:index, :show, :new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  def destroy
    @item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:category_id, :code, :name, :image, :price, :taxrate)
  end

  def set_category
    @categories = Category.all
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_cart
    if session[:cart_id]
      @cart_id = session[:cart_id]
      @cart = Orderitem.where(cart_id: @cart_id)
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

