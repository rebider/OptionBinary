class AddColumPositionToTrades < ActiveRecord::Migration
  def change
  	add_column :Trades, :Position, :string
  end
end
