module DashboardHelper
	def trades_chart_data(start = 3.weeks.ago)
		won_by_day  = Trade.where(:User_id => current_user.id).where(result: 'WON').trades_grouped_by_date(start)
		tie_by_day  = Trade.where(:User_id => current_user.id).where(result: 'TIE').trades_grouped_by_date(start)
		lost_by_day = Trade.where(:User_id => current_user.id).where(result: 'LOST').trades_grouped_by_date(start)

		(start.to_date..Time.zone.today).map do |date|
			{
				date: date,
				total_won: won_by_day[date].try(:first).try(:total_trades) || 0,
				total_tie: tie_by_day[date].try(:first).try(:total_trades) || 0,
				total_lost: lost_by_day[date].try(:first).try(:total_trades) || 0,
				profit: (won_by_day[date].try(:first).try(:profit) || 0) +
						(tie_by_day[date].try(:first).try(:profit) || 0) +
						(lost_by_day[date].try(:first).try(:profit) || 0)
			}
		end

	end

	def today_trades_chart_data
		won_by_day = Trade.where(:User_id => current_user.id).where(result: 'WON').trades_grouped_by_date(Time.zone.today)
		tie_by_day = Trade.where(:User_id => current_user.id).where(result: 'TIE').trades_grouped_by_date(Time.zone.today)
		lost_by_day = Trade.where(:User_id => current_user.id).where(result: 'LOST').trades_grouped_by_date(Time.zone.today)



		[ { :label => 'WON', :value => won_by_day[Time.zone.today].try(:first).try(:total_trades) || 0 },
		  { :label => 'TIE', :value => tie_by_day[Time.zone.today].try(:first).try(:total_trades) || 0 },
		  { :label => 'LOST', :value => lost_by_day[Time.zone.today].try(:first).try(:total_trades) || 0 }
		 ]

	end


end
