class UserRolesController < ApplicationController
  before_filter :login_required
  
  def index
#    @user_roles = UserRole.all
  end
  
  def show
    @user_role = UserRole.find(params[:id])
  end
  
end
