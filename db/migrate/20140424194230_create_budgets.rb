class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :user_id, null: false
      t.float :amount, precision: 2, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
