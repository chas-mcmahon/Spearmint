class RemoveNameIndexOnCompanies < ActiveRecord::Migration
  def change
  	remove_index :companies, :name
  end
end
