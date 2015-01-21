class TransactionsController < ApplicationController
  helper_method :transactions_sort_column, :transactions_sort_direction
  
  def index
    @transactions = Kaminari.paginate_array(Transaction.order(transactions_sort_column + ' ' + transactions_sort_direction)).page(params[:transactions_page]).per(15)
    
    # Determine if we can eliminate any empty columns
    @error_code_column_count = @transactions.select { |result| result.error_code != "" }.select{ |result| result.error_code != nil }.count
    @receipt_nbr_column_count = @transactions.select { |result| result.receipt_nbr != "" }.select{ |result| result.receipt_nbr != nil }.count
  end
  
  def show
    @transaction = Transaction.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def transactions_sort_direction
      %w[asc desc].include?(params[:transactions_direction]) ?  params[:transactions_direction] : "desc"
    end

    ### Secure the sort column name ###
    def transactions_sort_column
      ["tranID", "CreateDate", "dev_id", "custID", "tran_status", "error_code", "tran_code", "card_nbr", "receipt_nbr", "amt_req", "amt_auth", "sec_tran_code"].include?(params[:transactions_sort]) ? params[:transactions_sort] : "CreateDate"
    end
end
