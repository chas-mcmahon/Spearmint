class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :cash_account

  validates :user_id, :account_id, :name, :amount, :monthly_contribution, :planned_date, presence: true

  #add callback so that the projected date gets updated before validation

end
