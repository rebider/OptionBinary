class AddColumnUserToBrokerAccounts < ActiveRecord::Migration
  def change
  	    add_reference :account_balances, :user, index: true, foreign_key: true
  end
end
