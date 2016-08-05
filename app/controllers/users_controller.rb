class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end
  
  private

  private
  
  def check_current_user
    redirect_to root_path if current_user != @user
  end
  
  def set_user
    @user = User.find(params[:id]) || current_user
  end
  
  def user_params
    params.require(:user).permit(:displayname, :email, :password, :password_confirmation)
  end
end
