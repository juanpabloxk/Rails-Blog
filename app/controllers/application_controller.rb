class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :cached_categories

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil? && !current_user.nil?
  end

  def authorized
    redirect_to unauthorized_url unless logged_in?
  end

  def cached_categories
    @categories = Category.all.map(&:name) unless defined? @categories
    @categories
  end
end
