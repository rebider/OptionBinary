class AlterTradesAccountId < ActiveRecord::Migration
def change

 	remove_column :trades, :Account_id, :integer
    add_column :trades, :BrokerAccount_id, :integer
	  add_index :trades, :BrokerAccount_id
  end
end
