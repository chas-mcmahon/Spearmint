class Budget < ActiveRecord::Base
  validates :user_id, :amount, presence: true
  belongs_to :user
  has_one :category
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

end