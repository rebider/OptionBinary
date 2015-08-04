class Trade < ActiveRecord::Base
  belongs_to :User
  belongs_to :Strategy
  belongs_to :Azzet
  belongs_to :BrokerAccount

  attr_accessible :User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest

  def self.trades_grouped_by_date(start)
  	trades = where(created_at: start.beginning_of_day..Time.zone.today)
  	trades = trades.group("date(created_at)")
  	trades = trades.select("created_at, count(result) as total_trades")
  	trades.group_by { |o| o.created_at.to_date }
  end

end
