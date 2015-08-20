class BrokerAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :broker
  has_many   :account_balances

  attr_accessible :name, :user_id, :broker_id, :DemoAccount, :Balance

  def self.name_with_broker
  	@nombre = Broker.where(:id => broker_id).pluck(:Name)
    "#{name} (#{@nombre})"
  end
   

  def self.user_brokerAccounts(userId)
  	brokerAccount = where(user_id: userId).order(:name)
  end

  def self.real_balance(userId)
    brokerAccount = where(user_id: userId).where("\"DemoAccount\" = '0'")
    brokerAccount = brokerAccount.select("sum(\"Balance\") as balance")
  end

  def self.demo_balance(userId)
    brokerAccount = where(user_id: userId).where("\"DemoAccount\" = '1'")
    brokerAccount = brokerAccount.select("sum(\"Balance\") as balance")
  end

  def self.real_accounts(userId)
    brokerAccount = where(user_id: userId).where("\"DemoAccount\" = '0'")
    brokerAccount = brokerAccount.select("id")
  end

  def self.demo_accounts(userId)
    brokerAccount = where(user_id: userId).where("\"DemoAccount\" = '1'")
    brokerAccount = brokerAccount.select("id")
  end
end
