class AccountBalance < ActiveRecord::Base
  has_many :brokers
  belongs_to :broker_account
  attr_accessible :broker_account_id, :Amount, :Type, :TradeID, :Balance
end
