module StrategiesHelper
	def strategy_chart_data_filter(start, date_end , account, strategy, asset )
		#Rails.logger.info "current_user #{current_user.inspect}"
		win_by_day   = Trade.where(:User_id => 1).where(result:  "WIN").count
		tie_by_day   = Trade.where(:User_id => current_user.id).where(result:  "TIE").trades_grouped_by_date_filter_strategy(start,date_end)
		lost_by_day  = Trade.where(:User_id => current_user.id).where(result: "LOST").trades_grouped_by_date_filter_strategy(start,date_end)
		strategy     = Strategy.where(id: Trade.where(:User_id => current_user.id)).pluck(:Name)
		Rails.logger.info "Nombre Estrategia #{win_by_day}"

			(strategy).map do |estrategia|
				{	
					 created_at: "#{estrategia}",
					 total_win:  win_by_day  || 0,
					 total_tie:  tie_by_day.try(:first).try(:total)  || 0,
					 total_lost: lost_by_day.try(:first).try(:total)  || 0, 
				}

		end
	end	
end
