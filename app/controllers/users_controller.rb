class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render layout: 'external'
  end

  def create
    @user = User.create(params.require(:user).permit(:username,:password))
    session[:user_id] = @user.id
    redirect_to articles_path
  end

  def add_follower
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
    followed.followers << follower
    redirect_to request.referrer
  end

  def del_follower
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
    followed.followers.delete(follower) 
    redirect_to request.referrer
  end
end
