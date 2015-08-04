class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :Name
      t.string :Url
      t.string :Image
      t.string :Regulated
      t.string :MinimumDeposit
      t.string :MinimumAmountTrade
      t.string :MaximunAmountTrade
      t.string :Expirations
      t.bool :DemoAccount
      t.bool :USAFriendly

      t.timestamps null: false
    end
  end
end
