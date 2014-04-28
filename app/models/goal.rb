class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :cash_account

  validates :user_id,
            :cash_account_id,
            :name, :amount,
            :monthly_contribution,
            :planned_date,
            presence: true
  before_validation :check_account_open
  after_validation :update_projected_date

  def update_projected_date
    months = self.amount / self.monthly_contribution
    self.projected_date = Date.today.next_month(months)
  end

  def check_account_open
    self.user.cash_accounts.each do |acct|
    end
  end
end
