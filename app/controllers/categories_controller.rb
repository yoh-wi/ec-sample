class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit]
  
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    @categories = Category.all
  end

  private
  def category_params
    params.require(:category).permit(:code, :name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
