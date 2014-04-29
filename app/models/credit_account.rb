class CreditAccount < ActiveRecord::Base
  include MoneyHelper
  validates :name, :company_id, :balance_cents, :total_credit_cents, presence: true
  belongs_to :company
  has_many :transactions, as: :transactionable

  def update_balance
    self.transactions.each do |transaction|
      if transaction.transaction_type == "debit"
       self.balance_cents += transaction.amount_cents
      else
       self.balance_cents -= transaction.amount_cents
      end
    end
    self.balance_cents
  end

  def available_credit
    self.total_credit_cents - self.balance_cents
  end

  def available_credit_dollars
    convert_cents(self.total_credit_cents - self.balance_cents)
  end

  def get_total_credit_dollars
    convert_cents(self.total_credit_cents)
  end

  def get_balance_dollars
    convert_cents(self.balance_cents)
  end
end
