class CreateCreditAccounts < ActiveRecord::Migration
  def change
    create_table :credit_accounts do |t|
      t.string :name, null: false
      t.integer :company_id, null: false
      t.integer :total_credit_cents, null: false
      t.integer :balance_cents, null: false
      t.float :apr, precision: 3
      t.timestamps
    end
  end
end
