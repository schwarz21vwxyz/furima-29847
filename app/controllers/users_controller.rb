class UsersController < ApplicationController

  def new
    @users = User.new
  end


  def create
    @users = User.new(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:nick_name, :email, :password, :family_name, :name, :family_name_show, :name_show, :birthday)
  end
end