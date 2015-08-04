class AlterTradesAssetIndex < ActiveRecord::Migration
 def change
 	remove_column :trades, :Azzed_id, :integer
  end

  add_index :trades, :Azzet_id
end
