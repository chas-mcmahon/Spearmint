class Budget < ActiveRecord::Base
  validates :user_id, :category_id, :amount, presence: true
  belongs_to :user
  belongs_to :category
  has_many :transactions, through: :category, source: :transactions

  def calculate_expenditures
    total = 0
    self.transactions.each do |transaction|
      if transaction.date <= self.end_date && transaction.date >= self.start_date
        total += transaction.amount
      end
    end
    total
  end

  def amount_left
    self.amount - self.calculate_expenditures
  end

end