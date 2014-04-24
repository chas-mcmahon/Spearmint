class AddCategoryIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :category_id, :integer, null: false
    add_index :transactions, :category_id
  end
end
