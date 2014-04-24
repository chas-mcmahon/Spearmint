class Category < ActiveRecord::Base
  validates :name, :budget_id, presence: true
  belongs_to :budget
  has_many :transactions
end