class AlterTradesBrokerId < ActiveRecord::Migration
def change

 	remove_column :trades, :Broker_id, :integer
    add_column :trades, :Account_id, :integer
	  add_index :trades, :Account_id
  end


end
