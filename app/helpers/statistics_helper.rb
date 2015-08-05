module StatisticsHelper

	def trades_chart_data(start = 3.weeks.ago)
		win_by_day  = Trade.where(:User_id => current_user.id).where(result: 'WIN') .trades_grouped_by_date(start)
		tie_by_day  = Trade.where(:User_id => current_user.id).where(result: 'TIE') .trades_grouped_by_date(start)
		lost_by_day = Trade.where(:User_id => current_user.id).where(result: 'LOST').trades_grouped_by_date(start)

		(start.to_date..Time.zone.today).map do |date|
			{
				
				 created_at: "#{date}",
				 total_win:  win_by_day[date] .try(:first).try(:total_trades)  || 0,
				 total_tie:  tie_by_day[date] .try(:first).try(:total_trades)  || 0,
				 total_lost: lost_by_day[date].try(:first).try(:total_trades)  || 0,
			}
		end

	end

end
