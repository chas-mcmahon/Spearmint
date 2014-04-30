class CompaniesController < ApplicationController

  def new
    @company = Company.new()
  end

  def create
    @company = current_user.companies.new(company_params)
    @user = current_user
    if @company.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @company.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @company.errors.full_messages
      render :edit
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
    params.require(:company).permit(:name, :host_url, :sign_in_url, :date_added)
  end
end
