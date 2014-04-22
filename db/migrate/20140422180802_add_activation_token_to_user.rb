class AddActivationTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :activation_token, :string, null: false
  end
end
