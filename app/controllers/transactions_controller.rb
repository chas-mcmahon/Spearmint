class TransactionsController < ApplicationController

  def index
    @transactions = current_user.transactions
    @categories = Category.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_url
    else
      flash[:errors] = @transaction.errors.full_messages
      redirect_to transactions_url
    end
  end

  #implement button for this
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy!
    redirect_to transactions_url
  end

  private
  def transaction_params
    params.require(:transaction).permit(
      :amount,
      :description,
      :date,
      :user_id,
      :category_id,
      :transaction_type)
  end
end
