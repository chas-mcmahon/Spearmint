class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to goals_url
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  #only available from edit page, to get the id
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy!
    redirect_to goals_url
  end

  private
  def goal_params
    params.require(:goal).permit(
      :name,
      :account_id,
      :amount_cents,
      :monthly_contribution_cents,
      :planned_date)
  end
end
