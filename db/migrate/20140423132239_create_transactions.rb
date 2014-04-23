class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :transactionable, polymorphic: true
      t.float :amount, precision: 2,  null: false
      t.date :date
      t.string :description
      t.timestamps
    end
  end
end
