class BrokerAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :broker
  has_many   :account_balances
  attr_accessible :name, :user_id, :broker_id,:DemoAccount

  #def name_with_broker
  #	@nombre = Broker.where(:id => broker_id).pluck(:Name)
  #  "#{name} - #{@nombre}"
  #end
   

  def self.user_brokerAccounts(userId)

  	brokerAccount = where(user_id: userId).order(:Name)

  end

end
