class Company < ActiveRecord::Base
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :cash_accounts,
    class_name: "CashAccount",
    foreign_key: :company_id,
    primary_key: :id
  )

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true
end
