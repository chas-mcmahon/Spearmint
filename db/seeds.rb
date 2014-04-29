# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

start_date = Date.new(2014, 4, 1)
end_date = start_date.next_month

User.create({
  email: "chas@example.com",
  password: "password"
})

Company.create({
  name: "TD",
  user_id: 1,
  host_url: "tdbank.com",
  sign_in_url: "onlinebanking.tdbank.com/",
  date_added: start_date
})

Company.create({
  name: "Chase",
  user_id: 1,
  host_url: "chase.com",
  sign_in_url: "https://chaseonline.chase.com/",
  date_added: start_date
})

CashAccount.create({
  name: "TD Student Checking",
  company_id: 1,
  balance_cents: 70000,
  apy: 0.00
})

CashAccount.create({
  name: "TD Student Savings",
  company_id: 1,
  balance_cents: 200000,
  apy: 0.01
})

CreditAccount.create({
  name: "Credit Card",
  company_id: 2,
  total_credit_cents: 300000,
  balance_cents: 0,
  apr: 10
})

#make new company and update company_id here
LoanAccount.create({
  name: "Student Loan",
  company_id: 2,
  balance_cents: 1000000,
  minimum_payment_cents: 100000
})

Budget.create({
  user_id: 1,
  category_id: 1,
  amount_cents: 20000,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  category_id: 2,
  amount_cents: 22400,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  category_id: 3,
  amount_cents: 120000,
  start_date: start_date,
  end_date: end_date
})

Goal.create({
  user_id: 1,
  cash_account_id: 1,
  name: "New TV",
  amount_cents: 250000,
  monthly_contribution_cents: 25000,
  planned_date: Date.new(2014, 12, 1)
})

Goal.create({
  user_id: 1,
  cash_account_id: 2,
  name: "Emergency Fund",
  amount_cents: 400000,
  monthly_contribution_cents: 50000,
  planned_date: Date.new(2014, 8, 1)
})

Category.create({
  name: "Food"
})

Category.create({
  name: "Trasportation"
})

Category.create({
  name: "Rent"
})

CashAccount.first.transactions.create({
  amount_cents: 750,
  transaction_type: "debit",
  date: start_date.next_day,
  description: "Xian Famous Foods",
  user_id: 1,
  category_id: 1
})

i = 0
25.times do
  i += 1
  amount_cents = Random.new.rand(12500) + 1
  category = Random.new.rand(3) + 1
  day = Random.new.rand(30) + 1
  date = Date.new(2014, 4, day)
  type = Random.new.rand(2)+1
  type == 1 ? transaction_type = "debit" : transaction_type = "credit"

  # if type == 1
  #   transaction_type = "debit"
  # else
  #   transaction_type = "credit"
  # end

  CashAccount.first.transactions.create({
    amount_cents: amount_cents,
    transaction_type: transaction_type,
    date: date,
    description: "Transaction#{i}",
    user_id: 1,
    category_id: category
  })
end















