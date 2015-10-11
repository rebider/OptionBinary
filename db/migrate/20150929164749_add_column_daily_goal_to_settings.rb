class AddColumnDailyGoalToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :DailyGoalPercent, :string
  end
end
