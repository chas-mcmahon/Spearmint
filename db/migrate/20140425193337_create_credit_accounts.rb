class CreateCreditAccounts < ActiveRecord::Migration
  def change
    create_table :credit_accounts do |t|
      t.string :name, null: false
      t.integer :company_id, null: false
      t.float :total_credit, null: false, precision: 2
      t.float :balance, null: false, precision: 2
      t.float :apr, precision: 2
      t.timestamps
    end
  end
end
