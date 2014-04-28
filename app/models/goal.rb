class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :cash_account

  validates :user_id, :account_id, :name, :amount, :monthly_contribution, :planned_date, presence: true
  before_validation :update_projected_date

  def update_projected_date
    months = self.amount / self.monthly_contribution
    self.projected_date = Date.today.next_month(months)
  end
end
