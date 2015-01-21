class DevicesController < ApplicationController
  helper_method :transactions_sort_column, :transactions_sort_direction # For sorting device's transactions
  helper_method :cards_sort_column, :cards_sort_direction # For sorting device's cards
  
  def index
    @devices = Kaminari.paginate_array(Device.all).page(params[:page]).per(20)
  end
  
  def show
    @device = Device.find(params[:id])
    @transactions = Kaminari.paginate_array(Transaction.where(dev_id: @device.id).order(transactions_sort_column + ' ' + transactions_sort_direction)).page(params[:transaction_page]).per(15)
    @dev_statuses = Kaminari.paginate_array(DevStatus.where(dev_id: @device.id).order("date_time DESC")).page(params[:dev_statuses_page]).per(15)
    @cards = Kaminari.paginate_array(Card.where(dev_id: @device.id).order(cards_sort_column + ' ' + cards_sort_direction)).page(params[:page]).per(15)
    
    # Determine if we can eliminate any empty columns
    @error_code_column_count = @transactions.select { |result| result.error_code != "" }.select{ |result| result.error_code != nil }.count
    @receipt_nbr_column_count = @transactions.select { |result| result.receipt_nbr != "" }.select{ |result| result.receipt_nbr != nil }.count
  end
  
  private

    ### Secure the sort direction of device's transactions ###
    def transactions_sort_direction
      %w[asc desc].include?(params[:transactions_direction]) ?  params[:transactions_direction] : "desc"
    end

    ### Secure the sort column name of device's transactions ###
    def transactions_sort_column
      ["tranID", "CreateDate", "dev_id", "custID", "tran_status", "error_code", "tran_code", "card_nbr", "receipt_nbr", "amt_req", "amt_auth", "sec_tran_code"].include?(params[:transactions_sort]) ? params[:transactions_sort] : "CreateDate"
    end
    
    ### Secure the cards sort direction ###
    def cards_sort_direction
      %w[asc desc].include?(params[:cards_direction]) ?  params[:cards_direction] : "desc"
    end

    ### Secure the cards sort column name ###
    def cards_sort_column
      ["card_nbr", "bank_id_nbr", "dev_id", "card_amt", "avail_amt", "card_status", "issued_date", "last_activity_date", "receipt_nbr", "barcodeHash", "card_seq"].include?(params[:cards_sort]) ? params[:cards_sort] : "last_activity_date"
    end
    
end
