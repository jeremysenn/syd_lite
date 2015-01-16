class DevicesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @devices = Kaminari.paginate_array(Device.order(sort_column + ' ' + sort_direction).last(20)).page(params[:page]).per(15)
  end
  
  def show
    @device = Device.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    ### Secure the sort column name ###
    def sort_column
      ["dev_id", "CreateDate", "dev_id", "custID", "tran_status", "error_code", "tran_code", "card_nbr", "receipt_nbr", "amt_req", "amt_auth", "sec_tran_code"].include?(params[:sort]) ? params[:sort] : "CreateDate"
    end
end
