class BudgetsController < ApplicationController

  def index
    @budgets = current_user.budgets
  end

  def create
    @budget = current_user.budgets.new(budget_params)
    if @budget.save
      redirect_to budgets_url
    else
      flash[:errors] = @budget.errors.full_messages
      redirect_to budgets_url
    end
  end

  def destroy
    budget = Budget.find(params[:id])
    budget.destroy!
    redirect_to budgets_url
  end

  private
  def budget_params
    params.require(:budget).permit(:category_id, :amount_cents, :start_date, :end_date)
  end
end
