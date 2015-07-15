class Trade < ActiveRecord::Base
  belongs_to :User
  belongs_to :broker
  belongs_to :Strategy
  belongs_to :Asset
  belongs_to :broker_account
  attr_accessible :User_id, :Broker_id, :Strategy_id, :Asset_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest



end
