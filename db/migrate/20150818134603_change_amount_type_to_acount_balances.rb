class ChangeAmountTypeToAcountBalances < ActiveRecord::Migration
  def change
  	 	remove_column :account_balances, :Amount, :string
    	add_column :account_balances, :Amount, :float

  end
end
