class AddNameToCashAccounts < ActiveRecord::Migration
  def change
    add_column :cash_accounts, :name, :string, null: false
  end
end
