class CashAccount < ActiveRecord::Base
  validates :name, :company_id, :balance, presence: true

  belongs_to :company
  has_one :goal
  has_many :transactions, as: :transactionable

  #maybe nest under user model to help include non-acct transactions(cash)
  def update_balance
    self.transactions.each do |transaction|
      if transaction.transaction_type == "debit"
       self.balance -= transaction.amount
      else
       self.balance += transaction.amount
      end
    end
    self.balance
  end

  def available_credit
    self.total_credit - self.balance
  end

end
