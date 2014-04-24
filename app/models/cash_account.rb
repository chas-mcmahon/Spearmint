class CashAccount < ActiveRecord::Base
  validates :company_id, :balance, presence: true

  belongs_to(
    :company,
    class_name: "Company",
    foreign_key: :company_id,
    primary_key: :id
  )

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

end
