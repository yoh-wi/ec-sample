class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :destroy]
  before_action :set_categoryall, only: [:index, :show, :create, :edit]
  before_action :move_to_index, except: :show

  def index
  end

  def show
    if session[:cart_id]
      @cart = Orderitem.where(cart_id: current_cart)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    render "index"
  end

  def edit
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
  end

  private
  def category_params
    params.require(:category).permit(:code, :name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_categoryall
    @categories = Category.all
  end

  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end
  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
