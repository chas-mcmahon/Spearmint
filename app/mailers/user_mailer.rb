class UserMailer < ActionMailer::Base
  default from: "notifications@spearmint.com"

  def confirmation_email(user)
    @user = user
    @url = activate_account_url(token: @user.activation_token)
    mail(to: user.email, subject: "Confirm your Spearmint Account")
  end
end
