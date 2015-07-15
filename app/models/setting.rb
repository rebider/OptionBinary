class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay

end
