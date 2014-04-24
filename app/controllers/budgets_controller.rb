class BudgetsController < ApplicationController

  def index
    @budgets = current_user.budgets
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to #the budget index url
    else
      flash[:errors] = @budget.errors.full_messages
      redirect_to #also the budget index url
    end
  end

  def destroy
    budget = Budget.find(params[:id])
    budget.destroy!
    redirect_to #again, the budget index url
  end

  private
  def budget_params
    params.require(:budget).permit(:name, :user_id, :amount, :start_date, :end_date)
  end
end
