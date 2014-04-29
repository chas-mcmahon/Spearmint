class Goal < ActiveRecord::Base
  include MoneyHelper
  belongs_to :user
  belongs_to :cash_account

  validates :user_id,
            :cash_account_id,
            :name,
            :amount_cents,
            :monthly_contribution_cents,
            :planned_date,
            presence: true
  before_validation :check_account_open
  after_validation :update_projected_date

  def update_projected_date
    months = self.amount_cents / self.monthly_contribution_cents
    self.projected_date = Date.today.next_month(months)
  end

  def check_for_open_account
    self.user.cash_accounts.each do |acct|
    end
  end

  def get_amount_dollars
    convert_cents(self.amount_cents)
  end

  def get_contribution_dollars
    convert_cents(self.monthly_contribution_cents)
  end
end
