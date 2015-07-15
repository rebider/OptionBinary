class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :User, index: true, foreign_key: true
      t.references :Broker, index: true, foreign_key: true
      t.references :Strategy, index: true, foreign_key: true
      t.references :Asset, index: true, foreign_key: true
      t.string :Option
      t.string :Amount
      t.string :OnProfit
      t.string :OnLoss
      t.string :Payout
      t.string :Result
      t.string :UseMartingale
      t.string :UseCompoundInterest

      t.timestamps null: false
    end
  end
end
