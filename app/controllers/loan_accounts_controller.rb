class LoanAccountsController < ApplicationController

  def create
    @loan_account = LoanAccount.new(loan_account_params)
    @user = current_user
    if @loan_account.save
      redirect_to user_url(@user)
    else
      #check whether this should render or redirect
      flash[:errors] = @loan_account.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  #implement button for this
  def destroy
    @loan_account = LoanAccount.find_by(params[:id])
    @loan_account.destroy!
    @user = current_user
    #check whether user variable is necessary
    redirect_to user_url(@user)
  end

  private
  def loan_account_params
    params.require(:loan_account).permit(:name, :company_id, :balance_cents, :minimum_payment_cents)
  end
end
