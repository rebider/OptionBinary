class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay


  def self.user_settings(userId)

  	settings = where(user_id: userId)

  end
end
