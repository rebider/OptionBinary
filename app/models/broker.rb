class Broker < ActiveRecord::Base
has_many :account_balances
has_many :broker_accounts
attr_accessible :Name, :Url, :Image, :Regulated, :MinimumDeposit, :MinimumAmountTrade, :MaximunAmountTrade, :Expirations, :DemoAccount, :USAFriendly
end
