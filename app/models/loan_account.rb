class LoanAccount < ActiveRecord::Base
  validates :name, :company_id, :balance, :minimum_payment, presence: true
  belongs_to :company
  has_many :transactions, as: :transactionable

  def update_balance
    self.transactions.each do |transaction|
      self.balance -= transaction.amount
    end
    self.balance
  end
end
