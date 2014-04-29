class CashAccount < ActiveRecord::Base
  include MoneyHelper
  validates :name, :company_id, :balance_cents, presence: true

  belongs_to :company
  has_one :goal
  has_many :transactions, as: :transactionable

  #maybe nest under user model to help include non-acct transactions(cash)
  def update_balance
    self.transactions.each do |transaction|
      if transaction.transaction_type == "debit"
       self.balance_cents -= transaction.amount_cents
      else
       self.balance_cents += transaction.amount_cents
      end
    end
    self.balance_cents
  end

  def get_balance_dollars
    convert_cents(self.balance_cents)
  end

end
