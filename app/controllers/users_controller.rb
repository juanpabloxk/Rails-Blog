class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index 
    @users = User.all
  end

  def show
    @followers = %w[Hugo Paco Luis Lucas]
    @user = User.find(params[:id])
  end

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
