class Category < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_one :budget
  has_many :transactions
end