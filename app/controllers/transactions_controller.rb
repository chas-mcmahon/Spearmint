class TransactionsController < ApplicationController

  #implement pagination of transactions
  def index
    @transactions = current_user.transactions
    @categories = current_user.categories
  end

  def new
    @transaction = Transaction.new()
    @categories = current_user.categories
    render :new
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to transactions_url
    else
      flash[:errors] = @transaction.errors.full_messages
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @categories = current_user.categories
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to transactions_url
    else
      flash.now[:errors] = @transaction.errors.full_messages
      render :edit
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
      :amount_cents,
      :description,
      :date,
      :category_id,
      :transaction_type)
  end
end
