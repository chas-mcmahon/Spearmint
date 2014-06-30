class Api::TransactionsController < ApplicationController

  before_action :require_sign_in!

  def index
    @transactions = current_user.transactions.includes(:category)
    render json: @transactions.to_json(include: :category)

    # @transactions = current_user.transactions.includes(:category)
    # @categories = current_user.categories
    # render json: {transactions: @transactions,
    #               categories: @categories}
  end

  def create
    @transaction = current_user.transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    #check that this is the right way to get the transaction
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      render json: @transaction.to_json
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy!
    render json: {}
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