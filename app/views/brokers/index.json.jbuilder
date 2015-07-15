json.array!(@brokers) do |broker|
  json.extract! broker, :id, :Name, :Url, :Image, :Regulated, :MinimumDeposit, :MinimumAmountTrade, :MaximunAmountTrade, :Expirations, :DemoAccount, :USAFriendly
  json.url broker_url(broker, format: :json)
end
