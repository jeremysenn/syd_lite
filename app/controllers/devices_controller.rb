class DevicesController < ApplicationController
  before_filter :login_required
  
  helper_method :transactions_sort_column, :transactions_sort_direction # For sorting device's transactions
  helper_method :cards_sort_column, :cards_sort_direction # For sorting device's cards
  helper_method :devices_sort_column, :devices_sort_direction # For sorting devices
  
  def index
    if current_user.dev_group.blank? and current_user.dev_site.blank? # No device limitations
      unless devices_sort_column == 'remaining'
        @devices = Kaminari.paginate_array(Device.order(devices_sort_column + ' ' + devices_sort_direction)).page(params[:page]).per(20)
      else
        @devices = Kaminari.paginate_array(Device.all.sort_by(&:remaining)).page(params[:page]).per(20) if devices_sort_direction == 'asc'
        @devices = Kaminari.paginate_array(Device.all.sort_by(&:remaining).reverse).page(params[:page]).per(20) if devices_sort_direction == 'desc'
      end
    else # Limit devices by user's dev_group and dev_site
      unless devices_sort_column == 'remaining'
        @devices = Kaminari.paginate_array(Device.where("dev_group = #{current_user.dev_group} OR dev_site = #{current_user.dev_site}").order(devices_sort_column + ' ' + devices_sort_direction)).page(params[:page]).per(20)
      else
        @devices = Kaminari.paginate_array(Device.all.sort_by(&:remaining)).page(params[:page]).per(20) if devices_sort_direction == 'asc'
        @devices = Kaminari.paginate_array(Device.all.sort_by(&:remaining).reverse).page(params[:page]).per(20) if devices_sort_direction == 'desc'
      end
    end
    respond_to do |format|
      format.html
      format.js # for ajax polling
    end
  end
  
  def show
    @device = Device.find(params[:id])
    @transactions = Kaminari.paginate_array(@device.transactions.order(transactions_sort_column + ' ' + transactions_sort_direction)).page(params[:transactions_page]).per(15)
    @dev_statuses = Kaminari.paginate_array(@device.dev_statuses.order("date_time DESC")).page(params[:dev_statuses_page]).per(10)
    @cards = Kaminari.paginate_array(@device.cards.order(cards_sort_column + ' ' + cards_sort_direction)).page(params[:cards_page]).per(10)
    @bill_hists = Kaminari.paginate_array(@device.bill_hists.order("cut_dt DESC")).page(params[:bill_hists_page]).per(40)
    
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
    
    ### Secure the devices sort direction ###
    def devices_sort_direction
      %w[asc desc].include?(params[:devices_direction]) ?  params[:devices_direction] : "asc"
    end

    ### Secure the devices sort column name ###
    def devices_sort_column
      ["dev_id", "description", "online", "remaining"].include?(params[:devices_sort]) ? params[:devices_sort] : "dev_id"
    end
    
end
