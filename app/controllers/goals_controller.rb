class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to goals_url
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
      :user_id,
      :account_id,
      :amount,
      :monthly_contribution,
      :planned_date)
  end
end
