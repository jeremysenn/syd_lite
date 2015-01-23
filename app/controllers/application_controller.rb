class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_user
#    @current_user ||= UserRole.find_by_user_name(session[:user_name]) if session[:user_name]
    @current_user ||= UserRole.find_by_user_name(cookies[:user_name]) if cookies[:user_name]
  end
  helper_method :current_user
  
  def logged_in?
    current_user
  end
  
  def login_required
    unless logged_in?
#      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    else
      session[:user_id] = current_user.id
    end
  end
end
