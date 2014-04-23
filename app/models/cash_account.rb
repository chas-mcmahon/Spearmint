class CashAccount < ActiveRecord::Base
  validates :company_id, :balance, presence: true

  belongs_to {
    :company,
    class_name: "Company",
    foreign_key: :company_id,
    primary_key: :id
  }

  has_many :transactions, as :transactionable

end
