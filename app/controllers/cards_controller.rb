class CardsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @cards = Kaminari.paginate_array(Card.order(sort_column + ' ' + sort_direction)).page(params[:page]).per(20)
  end
  
  def show
    @card = Card.find(params[:id])
  end
  
  private

    ### Secure the sort direction ###
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    ### Secure the sort column name ###
    def sort_column
      ["card_nbr", "bank_id_nbr", "dev_id", "card_amt", "avail_amt", "card_status", "issued_date", "last_activity_date", "receipt_nbr", "barcodeHash", "card_seq"].include?(params[:sort]) ? params[:sort] : "last_activity_date"
    end
end
