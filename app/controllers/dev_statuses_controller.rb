class DevStatusesController < ApplicationController
  
  def index
    @dev_statuses = Kaminari.paginate_array(DevStatus.order("date_time DESC").first(100)).page(params[:dev_statuses_page]).per(20)
  end
  
  def show
    @dev_status = DevStatus.find(params[:id])
  end
  
end
