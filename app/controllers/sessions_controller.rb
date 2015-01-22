class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = UserRole.authenticate(params[:login], params[:password])
    if user
#      if user.user_signed_in? # User already signed in, so create new :auth_token
#        user.generate_token(:auth_token)
#        user.save
#      end
      session[:user_id] = user.id # Store user.id as a session variable.
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token # Store auth_token in a permanent cookie so can remember next time.
      else
        cookies[:auth_token] = user.auth_token # Store auth_token in a temporary cookie.
      end
      redirect_to_target_or_default home_url, :notice => "You have been logged in."
    else
      flash.now[:error] = "Invalid username or password, or user has been deactivated."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to '/login', :notice => "You have been logged out."
#    redirect_to home_url, :notice => "You have been logged out." if mobile_device?
#    redirect_to '/', :notice => "You have been logged out." if not mobile_device?
#    redirect_to root_url, :notice => "You have been logged out."
  end

end