class Transaction < ActiveRecord::Base

  belongs_to :transactionable, polymorphic: true
  validates :amount, presence: true

end