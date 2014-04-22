class CreateCashAccounts < ActiveRecord::Migration
  def change
    create_table :cash_accounts do |t|
      t.integer :user_id, null: false
      t.integer :balance, null: false
      t.integer :available_cash
      t.string :account_type
      t.boolean :active_status
      t.float :apy
      t.string :company_name

      t.timestamps
    end
    add_index :cash_accounts, :user_id, unique: true
  end
end