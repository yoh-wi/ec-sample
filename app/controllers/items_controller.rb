class ItemsController < ApplicationController
  before_action :set_item ,only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @item = Item.new
    @items = Item.all
    @cart = session[:cartitems]
  end

  def show
    @categories = Category.all
    @cart = session[:cartitems]
  end

  def new
    @categories = Category.all
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
    params.require(:item).permit(:categorynumber, :category, :code, :name, :image, :price, :taxrate)
    # .merge(category_id: )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

