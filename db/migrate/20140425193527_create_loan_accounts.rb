class CreateLoanAccounts < ActiveRecord::Migration
  def change
    create_table :loan_accounts do |t|
      t.string :name, null: false
      t.integer :company_id, null: false
      t.integer :balance_cents, null: false
      t.integer :minimum_payment_cents, null: false
      t.timestamps
    end
  end
end
