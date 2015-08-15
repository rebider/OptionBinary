module StatisticsHelper

	def fecha
		start = 3.weeks.ago
		(start.to_date..Time.zone.today).map do |fecha|
				{	
				 date:  fecha
				}

		end
	end	


  def trades_chart_series(trades, start_time, end_time)
    trades_by_day = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("date(created_at)")
                    .select("created_at, count(result) as total_trades")


    (start_time.to_date..end_time.to_date).map do |date| 
        trade = trades_by_day.detect { |trade| trade.created_at.to_date == date }
        trade && trade.total_trades.to_i || 0
    end

  end

end
