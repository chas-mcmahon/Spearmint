# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.create({
  email: "chas@example.com",
  password: "password"
})

Company.create({
  name: "TD",
  user_id: 1,
  host_url: "tdbank.com/",
  sign_in_url: "onlinebanking.tdbank.com/",
  date_added: Date.today
})

CashAccount.create({
  name: "Checking",
  company_id: 1,
  balance: 100.00,
  apy: 0.00
})

Budget.create({
  user_id: 1,
  amount: 200.00,
  start_date: Date.today,
  end_date: Date.today.next_month
})

Category.create({
  name: "Food",
  budget_id: 1
})

# Transaction.create({
#   transactionable_id: 1,
#   transactionable_type: "CashAccount",
#   amount: 7.50,
#   type: "debit",
#   date: Date.today,
#   description: "Xian Famous Foods"
# })

CashAccount.first.transactions.create({
  amount: 7.50,
  transaction_type: "debit",
  date: Date.today,
  description: "Xian Famous Foods",
  user_id: 1,
  category_id: 1,
})

#next set up a buttload of transactions