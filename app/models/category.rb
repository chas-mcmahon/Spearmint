class Category < ActiveRecord::Base
  validates :name, presence: true
  # belongs_to :budget
  has_one :budget
  has_many :transactions
end