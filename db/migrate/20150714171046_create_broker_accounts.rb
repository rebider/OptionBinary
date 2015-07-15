class CreateBrokerAccounts < ActiveRecord::Migration
  def change
    create_table :broker_accounts do |t|
      t.references :User, index: true, foreign_key: true
      t.references :Broker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
