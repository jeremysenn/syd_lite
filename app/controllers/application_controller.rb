class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_user
    @current_user ||= UserRole.find(session[:user_name]) if session[:user_name]
  end
  helper_method :current_user
end
