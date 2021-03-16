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
    UsersHelper.create_user_graph @user
    redirect_to articles_path
  end

  def follow
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
    unless followed.blank? or follower.blank?
      followed.followers << follower
      UsersHelper.create_user_graph followed
      redirect_to request.referrer
    end
  end

  def unfollow
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
    unless followed.blank? or follower.blank?
      followed.followers.delete(follower)
      UsersHelper.create_user_graph followed
      redirect_to request.referrer
    end
  end
end

