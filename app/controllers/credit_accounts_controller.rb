class CreditAccountsController < ApplicationController

  def create
    @credit_account = CreditAccount.new(credit_account_params)
    @user = current_user
    if @credit_account.save
      redirect_to user_url(@user)
    else
      #check whether this should render or redirect
      flash[:errors] = @credit_account.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  #implement button for this
  def destroy
    @credit_account = CreditAccount.find_by(params[:id])
    @credit_account.destroy!
    @user = current_user
    #check whether user variable is necessary
    redirect_to user_url(@user)
  end

  private
  def credit_account_params
    params.require(:credit_account).permit(:name, :company_id, :balance, :total_credit, :apr)
  end
end
