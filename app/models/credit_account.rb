class CreditAccount < ActiveRecord::Base
  validates :name, :company_id, :balance, :total_credit, presence: true
  belongs_to :company
  has_many :transactions, as: :transactionable

  def update_balance
    self.transactions.each do |transaction|
      if transaction.transaction_type == "debit"
       self.balance += transaction.amount
      else
       self.balance -= transaction.amount
      end
    end
    self.balance
  end

  def available_credit
    self.total_credit - self.balance
  end
end
