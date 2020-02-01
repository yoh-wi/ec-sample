class ItemsController < ApplicationController
  before_action :set_category, only: [:index, :show, :new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_cart, only: [:index, :show]
  
  def index
    # @item = Item.new
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
    # if @item.destroy
    #   redirect_to new_item_path
    # end
  end

  private
  def item_params
    params.require(:item).permit(:categorynumber, :category_id, :code, :name, :image, :price, :taxrate)
    # .merge(category_id: )
  end

  def set_category
    @categories = Category.all
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_cart
    @cart_id = session[:cart_id]
    @cart = Orderitem.where(cart_id: @cart_id)
  end
end

