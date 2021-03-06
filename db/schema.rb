# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140703152507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "category_id",  null: false
    t.integer  "amount_cents", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "budgets", ["category_id"], name: "index_budgets_on_category_id", unique: true, using: :btree

  create_table "cash_accounts", force: true do |t|
    t.integer  "company_id",    null: false
    t.integer  "balance_cents", null: false
    t.float    "apy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          null: false
  end

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",        null: false
    t.integer  "user_id",     null: false
    t.string   "host_url"
    t.string   "sign_in_url"
    t.date     "date_added"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name", "user_id"], name: "index_companies_on_name_and_user_id", unique: true, using: :btree

  create_table "credit_accounts", force: true do |t|
    t.string   "name",               null: false
    t.integer  "company_id",         null: false
    t.integer  "total_credit_cents", null: false
    t.integer  "balance_cents",      null: false
    t.float    "apr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "cash_account_id",            null: false
    t.string   "name",                       null: false
    t.integer  "amount_cents",               null: false
    t.integer  "monthly_contribution_cents", null: false
    t.date     "planned_date",               null: false
    t.date     "projected_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_accounts", force: true do |t|
    t.string   "name",                  null: false
    t.integer  "company_id",            null: false
    t.integer  "balance_cents",         null: false
    t.integer  "minimum_payment_cents", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "transactionable_id"
    t.string   "transactionable_type"
    t.integer  "amount_cents",         null: false
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",              null: false
    t.string   "transaction_type"
    t.integer  "category_id",          null: false
  end

  add_index "transactions", ["category_id"], name: "index_transactions_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "password_digest",  null: false
    t.string   "session_token",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_token", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
