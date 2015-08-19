class RemoveDisuseColumns < ActiveRecord::Migration
  def change
  	remove_column :account_balances, :broker_id, :integer
  	remove_column :trades, :Created, :timestamp
  end
end
