class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render action: "new", alert: "User could not be created"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :description,:files, :avatar)
  end
end
