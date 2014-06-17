class Remove < ActiveRecord::Migration
  def change
    remove_index :categories, :name
  end
end
