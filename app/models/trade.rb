class Trade < ActiveRecord::Base

  scope :won, -> { where(:Result => 'WON') }
  scope :tie, -> { where(:Result => 'TIE') }
  scope :lost, -> { where(:Result => 'LOST') }
  scope :all_closed, -> { where.not(:Result => '') }

  belongs_to :User
  belongs_to :Strategy
  belongs_to :Azzet
  belongs_to :BrokerAccount

  attr_accessible :User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest

  def self.open_trades(userId)
    trades = where(:Result => '').where(:User_id => userId)
  end

  def self.user_trades(userId)
    trades = where(:User_id => userId)
  end

  def self.trades_grouped_by_date(start)
  	trades = where(created_at: start.beginning_of_day..Time.zone.now)
<<<<<<< HEAD
  	#trades = trades.group("date(created_at)")
    trades = trades.group("created_at")
  	trades = trades.select("date(created_at), count(\"#{:Result}\") as total_trades, SUM(\"#{:Payout}\"::float) as profit")
    #trades = trades.select(:created_at, count(:Result)).sum(:Payout)
  	#Rails.logger.info "Informacion #{trades.inspect}"
    trades.group_by { |o| o.created_at.to_date }
=======
    trades = trades.group("created_at")
  	trades = trades.select("created_at, count(\"#{:Result}\") as total_trades, SUM(\"#{:Payout}\"::float) as profit")
  	trades.group_by { |o| o.created_at.to_date }
>>>>>>> 494ec281f1fcf2da8ffca6d5afe8bec69065e015
  end

  def self.profit_grouped_by_date(start)
  	trades = where(created_at: start.beginning_of_day..Time.zone.now)
  	trades = trades.group("created_at")
  	trades = trades.select("created_at, sum(payout::integer) as profit")
  	trades.group_by { |o| o.created_at.to_date }
  end

  def self.total_trades_by_strategy(strategyId, userId)
    trades = where(strategy_id: strategyId).where(user_id: userId)
    trades = trades.group("result")
    trades = trades.select("result, count(id) as total_trades")
  end

  def self.total_trades_by_azzet(azzetId, userId)
    trades = where(azzet_id: azzetId).where(user_id: userId)
    trades = trades.group("result")
    trades = trades.select("result, count(id) as total_trades")
  end


end
