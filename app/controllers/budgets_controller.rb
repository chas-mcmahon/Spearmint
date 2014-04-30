class BudgetsController < ApplicationController

  def index
    @budgets = current_user.budgets
  end

  def new
    @budget = Budget.new
    @categories = current_user.categories
  end

  def create
    @budget = current_user.budgets.new(budget_params)
    if @budget.save
      redirect_to budgets_url
    else
      flash.now[:errors] = @budget.errors.full_messages
      render :new
    end
  end

  def edit
    @budget = Budget.find(params[:id])
    @categories = current_user.categories
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to budgets_url
    else
      flash.now[:errors] = @budgets.errors.full_messages
      render :edit
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
