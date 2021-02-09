class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :wellcome]

  def user_authenticated?
    @user && @user.authenticate(params[:password])
  end

  def new
    render layout: 'external'
  end
  
  def create
    @user = User.find_by(username: params[:username])
    auth = @user && @user.authenticate(params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/wellcome'
  end
  
  def login
    render layout: 'external'
  end
  
  def wellcome
    if logged_in?
      redirect_to '/'
    else
      render layout: 'external'
    end
  end
end
