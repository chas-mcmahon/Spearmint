class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.integer :cash_account_id, null: false
      t.string :name, null: false
      t.integer :amount_cents, null: false
      t.integer :monthly_contribution_cents, null: false
      t.date :planned_date, null: false
      t.date :projected_date
      t.timestamps
    end
  end
end
