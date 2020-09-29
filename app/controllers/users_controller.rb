class UsersController < ApplicationController

  def new
    @users = User.new
  end

  def create
    User.create(user_params)
end

private
def user_params
  params.require(:user).permit(:nick_name, :email, :encrypted_password, :family_name, :name, :family_name_show, :name_show, :birthday)
end