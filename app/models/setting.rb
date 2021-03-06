class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay, :DailyGoalPercent


  def self.user_settings(userId)
  	settings = where(user_id: userId)
  	if settings.blank? or settings.nil?
  		Setting.create(
  			:user_id => userId, 
  			:MaximumTradesPerDay => 10,  
  			:MaximumPercentPerTrade => 2.5, 
  			:MaximumPercentLossPerDay =>  10,
        :DailyGoalPercent => 3
  			)
  		return where(user_id: userId)
  	else
      return settings  
    end  	
  end
end
