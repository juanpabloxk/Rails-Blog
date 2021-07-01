class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @graph_image = UsersHelper.create_user_graph @user
  end

  def new
    @user = User.new
    render layout: 'external'
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to articles_path
  end

  def follow
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
<<<<<<< HEAD
    unless followed.blank? || follower.blank?
      followed.followers << follower
      redirect_to request.referrer
    end
=======
    return if followed.blank? || follower.blank?

    followed.followers << follower
    redirect_to request.referrer
>>>>>>> cf572b7d8a368d094e866ce680c76a74dbe247e2
  end

  def unfollow
    follower = User.find(params[:follower_user_id])
    followed = User.find(params[:followed_user_id])
<<<<<<< HEAD
    unless followed.blank? || follower.blank?
      followed.followers.delete(follower)
      redirect_to request.referrer
    end
=======
    return if followed.blank? || follower.blank?

    followed.followers.delete(follower)
    redirect_to request.referrer
>>>>>>> cf572b7d8a368d094e866ce680c76a74dbe247e2
  end
end
