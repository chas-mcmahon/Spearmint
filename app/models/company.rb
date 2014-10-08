class Company < ActiveRecord::Base
  include MoneyHelper
  belongs_to :user

  has_many :cash_accounts
  has_many :credit_accounts
  has_many :loan_accounts

  validates :name, :user_id, presence: true
  validates :name, uniqueness: {scope: :user_id}

  #update to include the values of all account types
  def total_accounts_value_dollars
    total = 0
    self.cash_accounts.each do |acct|
      total += acct.update_balance
    end

    #currently just uses available credit; maybe should account for credit taken out instead
    self.credit_accounts.each do |acct|
      total += acct.available_credit
    end

    self.loan_accounts.each do |acct|
      total -= acct.update_balance
    end
    convert_cents(total)
  end
end
