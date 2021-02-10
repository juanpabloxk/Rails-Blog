class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    render layout: 'external'
  end
  
  def create
    @user = User.create(params.require(:user).permit(:username,:password))
    session[:user_id] = @user.id
    redirect_to '/articles'
  end
end
