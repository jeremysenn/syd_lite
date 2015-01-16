class AccountsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @accounts = Kaminari.paginate_array(Account.order(sort_column + ' ' + sort_direction)).page(params[:page]).per(20)
  end
  
  def show
    @account = Account.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    ### Secure the sort column name ###
    def sort_column
      ["ActID", "CustomerID", "Balance"].include?(params[:sort]) ? params[:sort] : "ActID"
    end
end
