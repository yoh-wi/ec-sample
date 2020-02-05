class Adm::UsersController < ApplicationController
  before_action :move_to_index
  
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.toggle!(:admin)
    redirect_to adm_users_path
  end

  private
  # def user_register_params
  #   params.require(:user).permit(:id, :name, :email, :admin)
  # end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end