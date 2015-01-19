class DenomsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @denoms = Kaminari.paginate_array(Denom.order(sort_column + ' ' + sort_direction)).page(params[:page]).per(20)
  end
  
  def show
    @denom = Denom.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

    ### Secure the sort column name ###
    def sort_column
      ["dev_id", "denomination", "cassette_nbr", "cassette_id"].include?(params[:sort]) ? params[:sort] : "dev_id"
    end
end
