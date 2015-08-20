class AccountBalance < ActiveRecord::Base
  has_many :brokers
  belongs_to :broker_account
  attr_accessible :broker_account_id, :Amount, :Type, :TradeID, :Balance, :user_id

 def self.trades_grouped_by_date_filter_balance(start, date_end)
    trades = where(created_at: start.to_date..date_end.to_date)
    trades = trades.group("date(created_at)")
    trades = trades.select("date(created_at) as created_at, sum(\"#{:Amount}\"::float) as total_balance")
    trades.group_by { |o| o.created_at.to_date }
  end

  def self.account_balance(accountId)
  	accountbalances = where(broker_account_id: accountId)
  	accountbalances = accountbalances.select("sum(\"#{:Amount}\"::float) as current_balance")
  end

  def self.total_balance(userId)
    accountbalances = where(user_id: userId)
    accountbalances = accountbalances.select("sum(\"#{:Amount}\"::float) as current_balance")
  end

  def self.user_balances(userId)
    accountbalances = where(user_id: userId)
  end
end
