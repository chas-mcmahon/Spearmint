class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :host_url
      t.string :sign_in_url
      t.date :date_added
      t.timestamps
    end
    add_index :companies, :name, unique: true
  end
end
