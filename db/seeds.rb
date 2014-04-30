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

# ----Companies-------------

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

# -----Accounts------------

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

# -------Budgets-----------

Budget.create({
  user_id: 1,
  category_id: 1,
  amount_cents: 20000,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  category_id: 8,
  amount_cents: 22400,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  category_id: 9,
  amount_cents: 120000,
  start_date: start_date,
  end_date: end_date
})

Budget.create({
  user_id: 1,
  category_id: 4,
  amount_cents: 7500,
  start_date: start_date,
  end_date: end_date
})

# -----Goals-----------------

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

# ------Categories---------------

Category.create({
  name: "Groceries",
  user_id: 1
})

Category.create({
  name: "Restaurants",
  user_id: 1
})

Category.create({
  name: "Home Supplies",
  user_id: 1
})

Category.create({
  name: "Pharmacy",
  user_id: 1
})

Category.create({
  name: "Laundry",
  user_id: 1
})

Category.create({
  name: "Entertainment",
  user_id: 1
})

Category.create({
  name: "Clothing",
  user_id: 1
})

Category.create({
  name: "Transportation",
  user_id: 1
})

Category.create({
  name: "Rent",
  user_id: 1
})

Category.create({
  name: "Utilities",
  user_id: 1
})

Category.create({
  name: "Loans",
  user_id: 1
})

Category.create({
  name: "Miscellaneous",
  user_id: 1
})

Category.create({
  name: "Paycheck",
  user_id: 1
})

# ------Transactions--------------

def generate_transaction_data(amount_range, month, category, description)
  transaction_params = {};

  transaction_params['description'] = description
  transaction_params['account'] = Random.new.rand(2)
  transaction_params['amount_cents'] = Random.new.rand(amount_range) + 1
  transaction_params['category'] = category

  day = Random.new.rand(30) + 1
  transaction_params['date'] = Date.new(2014, month, day)

  type = Random.new.rand(2) + 1
  # type == 1 ? transaction_type = "debit" : transaction_type = "credit"
  transaction_params['transaction_type'] = "debit" #transaction_type

  transaction_params
end

def make_transaction(options)
  account = Random.new.rand(2)

  if account == 1
    CashAccount.first.transactions.create({
      amount_cents: options['amount_cents'],
      transaction_type: options['transaction_type'],
      date: options['date'],
      description: options['description'],
      user_id: 1,
      category_id: options['category']
    })
  else
    CreditAccount.first.transactions.create({
      amount_cents: options['amount_cents'],
      transaction_type: options['transaction_type'],
      date: options['date'],
      description: options['description'],
      user_id: 1,
      category_id: options['category']
    })
  end
end

CashAccount.first.transactions.create({
  amount_cents: 750,
  transaction_type: "debit",
  date: start_date.next_day,
  description: "Xian Famous Foods",
  user_id: 1,
  category_id: 2
})

month = 4

# Groceries 1
4.times do
  data = generate_transaction_data(7000, month, 1, "Compare Foods")
  make_transaction(data)
end
#Restaurants 2
15.times do
  data = generate_transaction_data(2500, month, 2, "Restaurant Associates")
  make_transaction(data)
end
#Home Supplies 3
2.times do
  data = generate_transaction_data(1800, month, 3, "Target")
  make_transaction(data)
end
#Pharmacy 4
15.times do
  data = generate_transaction_data(700, month, 4, "Rite Aid")
  make_transaction(data)
end
#Laundry 5
2.times do
  data = generate_transaction_data(2300, month, 5, "Local Laundromat")
  make_transaction(data)
end
#Entertainment 6
3.times do
  data = generate_transaction_data(3000, month, 6, "Regal Entertainment")
  make_transaction(data)
end
#Clothing 7
1.times do
  data = generate_transaction_data(8000, month, 7, "Ann Taylor Loft")
  make_transaction(data)
end
#Transportation 8
2.times do
  CashAccount.first.transactions.create({
    amount_cents: 11200,
    transaction_type: "debit",
    date: Date.new(2014, month, 30),
    description: "MTA",
    user_id: 1,
    category_id: 8
  })
end
#Rent 9
1.times do
  CashAccount.first.transactions.create({
    amount_cents: 120000,
    transaction_type: "debit",
    date: Date.new(2014, month, 30),
    description: "Rent payment",
    user_id: 1,
    category_id: 9
  })
end
#Utilities 10
1.times do
  data = generate_transaction_data(5500, month, 10, "Con Edison")
  make_transaction(data)
end
2.times do
  data = generate_transaction_data(10000, month, 10, "Verizon")
  make_transaction(data)
end
1.times do
  data = generate_transaction_data(7500, month, 10, "Time Warner")
end
#Loans 11
j = 0
4.times do
  j += 1
  date = Date.new(2014, j, 5)

  LoanAccount.first.transactions.create({
    amount_cents: LoanAccount.first.minimum_payment_cents,
    transaction_type: "debit",
    date: date,
    description: "Loan Payment",
    user_id: 1,
    category_id: 11
  })
end
#Miscellaneous 12
12.times do
  data = generate_transaction_data(3000, month, 12, "Daily Transaction")
  make_transaction(data)
end
# Paycheck 13
pay_day = 5;
2.times do
  CashAccount.first.transactions.create({
    amount_cents: 200000,
    transaction_type: "credit",
    date: Date.new(2014, 4, pay_day),
    description: "Company Direct Deposit",
    user_id: 1,
    category_id: 13
  })
  pay_day += 15
end

# i = 0
# 25.times do
#   i += 1
#   account = Random.new.rand(2)
#   amount_cents = Random.new.rand(12500) + 1
#   category = Random.new.rand(12) + 1
#   day = Random.new.rand(30) + 1
#   date = Date.new(2014, 4, day)
#   type = Random.new.rand(2)+1
#   type == 1 ? transaction_type = "debit" : transaction_type = "credit"
#
#   if account == 1
#     CashAccount.first.transactions.create({
#       amount_cents: amount_cents,
#       transaction_type: transaction_type,
#       date: date,
#       description: "Daily Transaction#{i}",
#       user_id: 1,
#       category_id: category
#     })
#   else
#     CreditAccount.first.transactions.create({
#       amount_cents: amount_cents,
#       transaction_type: transaction_type,
#       date: date,
#       description: "Daily Transaction#{i}",
#       user_id: 1,
#       category_id: category
#     })
#   end
# end


