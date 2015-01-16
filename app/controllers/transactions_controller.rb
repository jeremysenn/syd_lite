class TransactionsController < ApplicationController
  def index
    @transactions = Kaminari.paginate_array(Transaction.all.reverse).page(params[:page]).per(25)
  end
  
  def show
    @transaction = Transaction.find(params[:id])
  end
end
