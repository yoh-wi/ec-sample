class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
    @cart = session[:cartitems]
  end

  def show
    @item = Item.find(params[:id])
    @cart = session[:cartitems]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:categorynumber, :category, :code, :name, :image, :price, :taxrate)
  end
end
