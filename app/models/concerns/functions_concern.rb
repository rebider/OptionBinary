module FunctionsConcern
	extend ActiveSupport::Concern


	def get_amount_per_trade_recommended(broker_account_id, user_id)

		#AccountBalance.where(:BrokerAccount_id => broker_account_id).last()
		broker_account_id
	end

	def get_maximum_percent_per_trade_recommended(user_id)
		Setting.where(:User_id => user_id).first().MaximumPercentPerTrade
	end

	def get_maximum_percent_lost_per_day_recommended(user_id)
		Setting.where(:User_id => user_id).first().Maximumpercentlossperday
	end

	def get_maximum_trades_per_day_recommended(user_id)
		Setting.where(:User_id => user_id).first().MaximumTradesPerDay
	end

end