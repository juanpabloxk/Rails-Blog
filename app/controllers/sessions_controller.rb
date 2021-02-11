class SessionsController < ApplicationController
  skip_before_action :authorized, 
      only: [:new, :create, :wellcome, :auth_errors, :unauthorized]
  helper_method :auth_errors
  
  def new
    render layout: 'external'
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/articles'
    else
      redirect_to '/login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/wellcome'
  end
  
  def auth_errors
    @auth_errors ||= []
  end
  
  def unauthorized
    @auth_errors = ["You must log-in to see this page"] 
    wellcome
  end
  
  def wellcome
    render 'wellcome', layout: 'external'
  end
end
