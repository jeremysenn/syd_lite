class DevicesController < ApplicationController
  
  def index
    @devices = Kaminari.paginate_array(Device.all).page(params[:page]).per(20)
  end
  
  def show
    @device = Device.find(params[:id])
  end
  
end
