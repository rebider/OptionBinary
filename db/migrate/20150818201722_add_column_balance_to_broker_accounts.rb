class AddColumnBalanceToBrokerAccounts < ActiveRecord::Migration
  def change
  	add_column :broker_accounts, :Balance, :float
  end
end
