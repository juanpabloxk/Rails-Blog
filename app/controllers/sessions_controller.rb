class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :wellcome, :auth_errors, :unauthorized]
  helper_method :auth_errors
  layout 'external'

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to wellcome_path
  end

  def auth_errors
    @auth_errors ||= []
  end

  def unauthorized
    @auth_errors = ["You must log-in to see this page"] 
    render 'wellcome'
  end

  def wellcome
  end
end

