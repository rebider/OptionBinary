class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :MaximumTradesPerDay
      t.string :MaximumPercentPerTrade
      t.string :MaximumPercentLossPerDay

      t.timestamps null: false
    end
  end
end
