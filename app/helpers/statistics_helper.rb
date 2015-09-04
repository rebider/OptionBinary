module StatisticsHelper


  def trades_chart_series(trades, start_time = 1.months.ago, end_time = Time.zone.today)
    trades_by_day = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("date(created_at)")
                    .select("date(created_at) as created_at, count(\"#{:Result}\") as total_trades")


    (start_time.to_date..end_time.to_date).map do |date| 
        trade = trades_by_day.detect { |trade| trade.created_at.to_date == date }
        trade && trade.total_trades.to_i || 0
    end
  end

  def profit_chart_series(trades, start_time = 1.months.ago, end_time = Time.zone.today)
    trades_by_day = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("date(created_at)")
                    .select("date(created_at) as created_at, sum(payout::integer) as profit")


    (start_time.to_date..end_time.to_date).map do |date| 
        trade = trades_by_day.detect { |trade| trade.created_at.to_date == date }
        trade && trade.profit.to_i || 0
    end
  end

  def trades_by_result(trades, start_time = 1.months.ago, end_time = Time.zone.today)
    trades_result = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("\"Result\"")
                    .select("\"Result\", count(\"#{:Result}\") as total_trades")                    

    [ 
      { :name => 'Won', :y => trades_result[0].try(:total_trades) || 0, :color => '#5fa2dd' },
      { :name => 'Tie', :y => trades_result[1].try(:total_trades) || 0, :color => '#E6EBE0' },
      { :name => 'Lost', :y => trades_result[2].try(:total_trades) || 0, :color => '#F45B69' }
    ]
  end

  def trades_by_strategy(trades, start_time = 1.months.ago, end_time = Time.zone.today)
    trades_strategy = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("\"Strategy_id\"")
                    .select("\"Strategy_id\", count(id) as total_trades")        

    (trades.where(:User_id => current_user.id).group(:Strategy_id).order(:Strategy_id).pluck(:Strategy_id)).map do |s|
      trade = trades_strategy.detect { |trade| trade.Strategy_id == s }
      trade && trade.total_trades || 0
    end

  end

  def trades_by_azzet(trades, start_time = 1.months.ago, end_time = Time.zone.today)
    trades_azzets = trades.where(created_at: start_time.beginning_of_day..end_time.end_of_day)
                    .group("\"Azzet_id\"")
                    .select("\"Azzet_id\", count(id) as total_trades")        

    (trades.where(:User_id => current_user.id).group(:Azzet_id).order(:Azzet_id).pluck(:Azzet_id)).map do |s|
      trade = trades_azzets.detect { |trade| trade.Azzet_id == s }
      trade && trade.total_trades || 0
    end

  end

end
