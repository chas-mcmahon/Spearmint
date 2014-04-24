class CompaniesController < ApplicationController

  def create
    @company = Company.new(company_params)
    @user = current_user
    if @company.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @company.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  #implement button for this
  def destroy
    @company = Company.find(params[:id])
    @user = current_user
    @company.destroy!
    redirect_to user_url(@user)
  end

  private
  def company_params
    params.require(:company).permit(:name, :user_id, :host_url, :sign_in_url, :date_added)
  end
end
