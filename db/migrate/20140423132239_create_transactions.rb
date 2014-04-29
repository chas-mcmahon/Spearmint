class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :transactionable, polymorphic: true
      t.integer :amount_cents, null: false
      t.date :date
      t.string :description
      t.timestamps
    end
  end
end
