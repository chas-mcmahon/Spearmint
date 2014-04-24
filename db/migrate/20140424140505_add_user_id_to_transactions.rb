class AddUserIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :user_id, :integer, null: false
  end
end
