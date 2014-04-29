class Budget < ActiveRecord::Base
  include MoneyHelper
  validates :user_id, :category_id, :amount_cents, presence: true
  belongs_to :user
  belongs_to :category
  has_many :transactions, through: :category, source: :transactions

  def calculate_expenditures
    total = 0
    self.transactions.each do |transaction|
      if transaction.date <= self.end_date && transaction.date >= self.start_date
        total += transaction.amount_cents
      end
    end
    total
  end

  def expenditure_dollars
    convert_cents(self.calculate_expenditures)
  end

  def amount_left_dollars
    convert_cents(self.amount_cents - self.calculate_expenditures)
  end

  def get_amount_dollars
    convert_cents(self.amount_cents)
  end

end