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
    trades = trades.group("date(created_at)")
  	trades = trades.select("date(created_at) as created_at, count(id) as total_trades, sum(\"Payout\"::float) as profit")
  	trades.group_by { |o| o.created_at.to_date }

  end

  def self.profit_grouped_by_date(start)
  	trades = where(created_at: start.beginning_of_day..Time.zone.now)
  	trades = trades.group("date(created_at)")
  	trades = trades.select("date(created_at) as created_at, sum(payout::integer) as profit")
  	trades.group_by { |o| o.created_at.to_date }
  end

  def self.total_trades_by_strategy(strategyId, userId)
    trades = where(:Strategy_id => strategyId).where(:User_id => userId)
    trades = trades.group("Result")
    trades = trades.select("\"Result\", count(id) as total_trades")
  end

  def self.total_trades_by_azzet(azzetId, userId)
    trades = where(:Azzet_id => azzetId).where(:User_id => userId)
    trades = trades.group("Result")
    trades = trades.select("\"Result\", count(id) as total_trades")
  end


end
