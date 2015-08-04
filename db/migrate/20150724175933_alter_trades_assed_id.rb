class AlterTradesAssedId < ActiveRecord::Migration
 def change
 	remove_column :trades, :Asset_id, :integer
    add_column :trades, :Azzet_id, :integer

  end

  #add_index :trades, :Azzet_id
end
