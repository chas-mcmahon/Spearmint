class CreateCashAccounts < ActiveRecord::Migration
  def change
    create_table :cash_accounts do |t|
      t.integer :company_id, null: false
      t.float :balance, null: false, precision: 2
      t.float :apy, precision: 2
      t.timestamps
    end
  end
end