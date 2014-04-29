class CashAccountsController < ApplicationController

  def create
    @cash_account = CashAccount.new(cash_account_params)
    @user = current_user
    if @cash_account.save
      redirect_to user_url(@user)
    else
      #check whether this should render or redirect
      flash[:errors] = @cash_account.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  #implement button for this
  def destroy
    @cash_account = CashAccount.find_by(params[:id])
    @cash_account.destroy!
    @user = current_user
    #check whether user variable is necessary
    redirect_to user_url(@user)
  end

  private
  def cash_account_params
    params.require(:cash_account).permit(:name, :company_id, :balance_cents)
  end
end
