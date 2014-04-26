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
  balance: 700.00,
  apy: 0.00
})

CashAccount.create({
  name: "TD Student Savings",
  company_id: 1,
  balance: 2000.00,
  apy: 0.01
})

CreditAccount.create({
  name: "Credit Card",
  company_id: 2,
  total_credit: 3000.00,
  balance: 0,
  apr: 10.00
})

#make new company and update company_id here
LoanAccount.create({
  name: "Student Loan",
  company_id: 2,
  balance: 100000000,
  minimum_payment: 1000
})

Budget.create({
  user_id: 1,
  amount: 200.00,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  amount: 224.0,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  amount: 1200,
  start_date: start_date,
  end_date: end_date
})

Category.create({
  name: "Food",
  budget_id: 1
})

Category.create({
  name: "Trasportation",
  budget_id: 2
})

Category.create({
  name: "Rent",
  budget_id: 3
})

CashAccount.first.transactions.create({
  amount: 7.50,
  transaction_type: "debit",
  date: start_date.next_day,
  description: "Xian Famous Foods",
  user_id: 1,
  category_id: 1,
})

i = 0
25.times do
  i += 1
  amount = Random.new.rand(125) + 1
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
    amount: amount,
    transaction_type: transaction_type,
    date: date,
    description: "Transaction#{i}",
    user_id: 1,
    category_id: category
  })
end















