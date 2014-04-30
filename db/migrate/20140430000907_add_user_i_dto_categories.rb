class AddUserIDtoCategories < ActiveRecord::Migration
  def change
    add_column :categories, :user_id, :integer, null: false
    add_index :categories, :user_id
  end
end
