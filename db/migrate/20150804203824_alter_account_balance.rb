class AlterAccountBalance < ActiveRecord::Migration
  def change

  	remove_column :account_balances, :BrokerAccount_id, :integer
	add_reference :account_balances, :broker_account, index: true, foreign_key: true
  end
end
