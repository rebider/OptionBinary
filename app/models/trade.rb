class Trade < ActiveRecord::Base
  belongs_to :User
  has_many :Brokers
  belongs_to :Strategy
  belongs_to :Asset
  attr_accessible :User_id, :Broker_id, :Strategy_id, :Asset_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest
end
