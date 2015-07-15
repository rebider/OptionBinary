class AccountBalance < ActiveRecord::Base
  has_many :brokers
  has_many :broker_accounts
  attr_accessible :BrokerAccount_id, :Amount, :Type, :TradeID
end
