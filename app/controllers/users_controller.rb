class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(secure_params)
    redirect_to users_path, notice: t(:user_updated)
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: t(:user_destroyed)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation, :role)
  end

end
