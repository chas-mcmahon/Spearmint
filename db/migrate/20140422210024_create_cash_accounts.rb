class CreateCashAccounts < ActiveRecord::Migration
  def change
    create_table :cash_accounts do |t|
      t.integer :company_id, null: false
      t.integer :balance_cents, null: false
      t.float :apy, precision: 2
      t.timestamps
    end
  end
end