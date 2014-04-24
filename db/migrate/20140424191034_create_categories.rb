class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :budget_id, null: false

      t.timestamps
    end
    add_index :categories, :budget_id, unique: true
  end
end
