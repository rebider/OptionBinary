class RemoveTradesAssedid < ActiveRecord::Migration
 def change
 	remove_column :trades, :Azzed_id, :integer
  end
end
