class AddCompanyNameUserIndex < ActiveRecord::Migration
  def change
  	add_index :companies, [:name, :user_id], unique: :true
  end
end
