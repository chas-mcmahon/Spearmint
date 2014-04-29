class TransactionsController < ApplicationController

  #implement pagination of transactions
  def index
    @transactions = current_user.transactions
    @categories = Category.all
  end

  # def new
  #   @transaction = Transaction.new
  # end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to transactions_url
    else
      flash[:errors] = @transaction.errors.full_messages
      redirect_to transactions_url
    end
  end

  # def edit
  #
  # end

  # def update
  #
  # end

  #implement button for this
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy!
    redirect_to transactions_url
  end

  private
  def transaction_params
    params.require(:transaction).permit(
      :amount_cents,
      :description,
      :date,
      :category_id,
      :transaction_type)
  end
end
