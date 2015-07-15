class AddColumnsToBrokerAccounts < ActiveRecord::Migration
  def change
    add_column :broker_accounts, :DemoAccount, :string
  end
end
