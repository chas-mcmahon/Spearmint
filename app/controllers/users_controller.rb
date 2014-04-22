class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      msg = UserMailer.confirmation_email(@user)
      msg.deliver! #what's the difference between regular and bang?
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def activate_account
    @user = User.find_by(activation_token: params[:token])
    if @user
      # flash[:notice] << "You have successfully activated your account!"
      redirect_to user_url(@user)
    else
      #appropriate course of action?
      flash[:errors] << "Something went terribly wrong!"
      msg = UserMailer.confirmation_email(@user)
      msg.deliver!
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
