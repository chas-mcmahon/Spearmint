class LoanAccount < ActiveRecord::Base
  include MoneyHelper
  validates :name, :company_id, :balance_cents, :minimum_payment_cents, presence: true
  belongs_to :company
  has_many :transactions, as: :transactionable

  def update_balance
    self.transactions.each do |transaction|
      self.balance_cents -= transaction.amount_cents
    end
    self.balance_cents
  end

  def get_balance_dollars
    convert_cents(self.balance_cents)
  end

  def get_minimum_payment_dollars
    convert_cents(self.balance_cents)
  end
end
