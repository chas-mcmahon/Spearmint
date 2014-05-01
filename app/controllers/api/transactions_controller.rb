class Api::TransactionsController < ApplicationController

  def index

  end

  def create

  end

  def update

  end

  def destroy

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