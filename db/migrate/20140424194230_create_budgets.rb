class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :amount_cents, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :budgets, :category_id, unique: true
  end
end
