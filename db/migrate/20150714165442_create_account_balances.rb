class CreateAccountBalances < ActiveRecord::Migration
  def change
    create_table :account_balances do |t|
      t.references :BrokerAccount, index: true, foreign_key: true
      t.string :Amount
      t.string :Type
      t.string :TradeID

      t.timestamps null: false
    end
  end
end
