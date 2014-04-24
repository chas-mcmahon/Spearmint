class Transaction < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :transactionable, polymorphic: true
  validates :amount, presence: true
  validate :correct_type #maybe rename

  def correct_type
    if self.transaction_type != "debit" && self.transaction_type != "credit"
      raise "Invalid transaction type!"
    end
  end
end