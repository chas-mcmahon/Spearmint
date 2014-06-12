# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

start_date = Date.new(2014, 6, 1)
end_date = start_date.next_month

User.create({
  email: "chas@example.com",
  password: "password"
})

User.create({
  email: "guest@example.com",
  password: "guestPassword"
})

User.all.each do |user|

  # ----Companies-------------

  Company.create({
    name: "TD",
    user_id: user.id,
    host_url: "tdbank.com",
    sign_in_url: "onlinebanking.tdbank.com/",
    date_added: start_date
  })

  company1 = Company.where("name = 'TD'")

  Company.create({
    name: "Chase",
    user_id: user.id,
    host_url: "chase.com",
    sign_in_url: "https://chaseonline.chase.com/",
    date_added: start_date
  })

  company2 = Company.where("name = 'TD'")

  # -----Accounts------------

  CashAccount.create({
    name: "TD Student Checking",
    company_id: company1.id,
    balance_cents: 70000,
    apy: 0.00
  })

  cash1 = CashAccount.where("name = 'TD Student Checking'")

  CashAccount.create({
    name: "TD Student Savings",
    company_id: company1.id,
    balance_cents: 200000,
    apy: 0.01
  })

  cash2 = CashAccount.where("name = 'TD Student Savings'")

  CreditAccount.create({
    name: "Credit Card",
    company_id: company2.id,
    total_credit_cents: 300000,
    balance_cents: 0,
    apr: 10
  })

  credit1 = CreditAccount.where("name = 'Credit Card'")

  #make new company and update company_id here
  LoanAccount.create({
    name: "Student Loan",
    company_id: company2.id,
    balance_cents: 1000000,
    minimum_payment_cents: 100000
  })

  # -----Goals-----------------

  Goal.create({
    user_id: user.id,
    cash_account_id: cash1.id,
    name: "New TV",
    amount_cents: 250000,
    monthly_contribution_cents: 25000,
    planned_date: Date.new(2014, 12, 1)
  })

  Goal.create({
    user_id: user.id,
    cash_account_id: cash2.id,
    name: "Emergency Fund",
    amount_cents: 400000,
    monthly_contribution_cents: 50000,
    planned_date: Date.new(2014, 8, 1)
  })

  # ------Categories---------------

  Category.create({
    name: "Groceries",
    user_id: user.id
  })

  cat1 = Category.where("name = 'Groceries'")

  Category.create({
    name: "Restaurants",
    user_id: user.id
  })

  cat2 = Category.where("name = 'Restaurants'")

  Category.create({
    name: "Home Supplies",
    user_id: user.id
  })

  cat3 = Category.where("name = 'Home Supplies'")

  Category.create({
    name: "Pharmacy",
    user_id: user.id
  })

  cat4 = Category.where("name = 'Pharmacy'")

  Category.create({
    name: "Laundry",
    user_id: user.id
  })

  cat5 = Category.where("name = 'Laundry'")

  Category.create({
    name: "Entertainment",
    user_id: user.id
  })

  cat6 = Category.where("name = 'Entertainment'")

  Category.create({
    name: "Clothing",
    user_id: user.id
  })

  cat7 = Category.where("name = 'Clothing'")

  Category.create({
    name: "Transportation",
    user_id: user.id
  })

  cat8 = Category.where("name = 'Transportation'")

  Category.create({
    name: "Rent",
    user_id: user.id
  })

  cat9 = Category.where("name = 'Rent'")

  Category.create({
    name: "Utilities",
    user_id: user.id
  })

  cat10 = Category.where("name = 'Utilities'")

  Category.create({
    name: "Loans",
    user_id: user.id
  })

  cat11 = Category.where("name = 'Loans'")

  Category.create({
    name: "Miscellaneous",
    user_id: user.id
  })

  cat12 = Category.where("name = 'Miscellaneous'")

  Category.create({
    name: "Paycheck",
    user_id: user.id
  })

  cat13 = Category.where("name = 'Paycheck'")

  # -------Budgets-----------

  Budget.create({
    user_id: user.id,
    category_id: cat1.id,
    amount_cents: 20000,
    start_date: start_date,
    end_date: end_date
  })

  Budget.create({
    user_id: user.id,
    category_id: cat8.id,
    amount_cents: 22400,
    start_date: start_date,
    end_date: end_date
  })

  Budget.create({
    user_id: user.id,
    category_id: cat9.id,
    amount_cents: 120000,
    start_date: start_date,
    end_date: end_date
  })

  Budget.create({
    user_id: user.id,
    category_id: cat4.id,
    amount_cents: 7500,
    start_date: start_date,
    end_date: end_date
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
        user_id: user.id,
        category_id: options['category']
      })
    else
      CreditAccount.first.transactions.create({
        amount_cents: options['amount_cents'],
        transaction_type: options['transaction_type'],
        date: options['date'],
        description: options['description'],
        user_id: user.id,
        category_id: options['category']
      })
    end
  end

  cash1.transactions.create({
    amount_cents: 750,
    transaction_type: "debit",
    date: start_date.next_day,
    description: "Xian Famous Foods",
    user_id: user.id,
    category_id: cat2.id
  })

  month = 4

  # Groceries 1
  4.times do
    data = generate_transaction_data(7000, month, cat1.id, "Compare Foods")
    make_transaction(data)
  end

  #Restaurants 2
  15.times do
    data = generate_transaction_data(2500, month, cat2.id, "Restaurant Associates")
    make_transaction(data)
  end

  #Home Supplies 3
  2.times do
    data = generate_transaction_data(1800, month, cat3.id, "Target")
    make_transaction(data)
  end

  #Pharmacy 4
  15.times do
    data = generate_transaction_data(700, month, cat4.id, "Rite Aid")
    make_transaction(data)
  end

  #Laundry 5
  2.times do
    data = generate_transaction_data(2300, month, cat5.id, "Local Laundromat")
    make_transaction(data)
  end

  #Entertainment 6
  3.times do
    data = generate_transaction_data(3000, month, cat6.id, "Regal Entertainment")
    make_transaction(data)
  end

  #Clothing 7
  1.times do
    data = generate_transaction_data(8000, month, cat7.id, "Ann Taylor Loft")
    make_transaction(data)
  end

  #Transportation 8
  2.times do
    CashAccount.first.transactions.create({
      amount_cents: 11200,
      transaction_type: "debit",
      date: Date.new(2014, month, 30),
      description: "MTA",
      user_id: user.id,
      category_id: cat8.id
    })
  end

  #Rent 9
  1.times do
    CashAccount.first.transactions.create({
      amount_cents: 120000,
      transaction_type: "debit",
      date: Date.new(2014, month, 30),
      description: "Rent payment",
      user_id: user.id,
      category_id: cat9.id
    })
  end

  #Utilities 10
  1.times do
    data = generate_transaction_data(5500, month, cat10.id, "Con Edison")
    make_transaction(data)
  end
  2.times do
    data = generate_transaction_data(10000, month, cat10.id, "Verizon")
    make_transaction(data)
  end
  1.times do
    data = generate_transaction_data(7500, month, cat10.id, "Time Warner")
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
      user_id: user.id,
      category_id: cat11.id
    })
  end

  #Miscellaneous 12
  12.times do
    data = generate_transaction_data(3000, month, cat12.id, "Daily Transaction")
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
      user_id: user.id,
      category_id: cat13.id
    })
    pay_day += 15
  end

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
#       user_id: user.id,
#       category_id: category
#     })
#   else
#     CreditAccount.first.transactions.create({
#       amount_cents: amount_cents,
#       transaction_type: transaction_type,
#       date: date,
#       description: "Daily Transaction#{i}",
#       user_id: user.id,
#       category_id: category
#     })
#   end
# end


