class BillCountsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @bill_counts = Kaminari.paginate_array(BillCount.order(sort_column + ' ' + sort_direction)).page(params[:page]).per(20)
  end
  
  def show
    @bill_count = BillCount.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

    ### Secure the sort column name ###
    def sort_column
      ["host_start_count"].include?(params[:sort]) ? params[:sort] : "host_start_count"
    end
end
