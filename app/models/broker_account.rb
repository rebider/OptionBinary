class BrokerAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :broker
  attr_accessible :name, :user_id, :broker_id
end
