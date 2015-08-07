class AccountBalance < ActiveRecord::Base
  has_many :brokers
  belongs_to :broker_account
  attr_accessible :broker_account_id, :Amount, :Type, :TradeID, :Balance

  def self.trades_grouped_by_date_filter_balance(start, date_end)
    trades = where(created_at: start.to_date..date_end.to_date)
    trades = trades.group("date(created_at)")
    trades = trades.select("created_at, sum(Amount) as total_balance")
    trades.group_by { |o| o.created_at.to_date }
  end
end
