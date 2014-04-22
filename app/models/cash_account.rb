class CashAccount < ActiveRecord::Base
  validates :user_id, :balance, presence: true
  validates :user_id, uniqueness: true

  belongs_to {
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  }

  # has_many {
#     :transactions,
#     class_name: "Transaction",
#     foreign_key: :account_id,
#     primary_key: :id
#   }
end
