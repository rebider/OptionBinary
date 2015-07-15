class BrokerAccount < ActiveRecord::Base
  belongs_to :User
  belongs_to :Broker
  has_many   :account_balances
  has_many   :broker_accounts
  attr_accessible :User_id, :Broker_id
end
