class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = UserRole.authenticate(params[:user_name], params[:password])
    if user
#      if user.user_signed_in? # User already signed in, so create new :auth_token
#        user.generate_token(:auth_token)
#        user.save
#      end
#      session[:user_name] = user.user_name # Store user.user_name as a session variable.

      ### Need to change this to use auth_token once Paul adds auth_token column to user_roles table ###
      if params[:remember_me]
        cookies.permanent[:user_name] = user.user_name # Store user_name in a permanent cookie so can remember next time.
#        cookies.permanent[:auth_token] = user.auth_token # Store auth_token in a permanent cookie so can remember next time.
      else
        cookies[:user_name] = user.user_name # Store user_name in a temporary cookie.
#        cookies[:auth_token] = user.auth_token # Store auth_token in a temporary cookie.
      end
#      redirect_to_target_or_default root_url, :notice => "You have been logged in."
      redirect_to root_url, :notice => "You have been logged in."
    else
      flash.now[:error] = "Invalid username or password, or user has been deactivated."
      render :action => 'new'
    end
  end

  def destroy
#    session[:user_name] = nil
    cookies.delete(:user_name)
    redirect_to root_url, :notice => "You have been logged out."
  end

end
