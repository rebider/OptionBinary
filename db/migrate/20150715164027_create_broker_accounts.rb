class CreateBrokerAccounts < ActiveRecord::Migration
  def change
    create_table :broker_accounts do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :broker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
