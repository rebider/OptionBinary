class AddColumnBalanceToBrokerAccount < ActiveRecord::Migration
  def change
    add_column :account_balances, :Balance, :float
  end
end
