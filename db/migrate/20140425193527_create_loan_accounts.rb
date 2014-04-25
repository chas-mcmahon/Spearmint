class CreateLoanAccounts < ActiveRecord::Migration
  def change
    create_table :loan_accounts do |t|
      t.string :name, null: false
      t.integer :company_id, null: false
      t.float :balance, null: false, precision: 2
      t.float :minimum_payment, null: false, precision: 2
      t.timestamps
    end
  end
end
