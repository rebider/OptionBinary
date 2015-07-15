json.array!(@settings) do |setting|
  json.extract! setting, :id, :user_id, :MaximumTradesPerDay, :MaximumPercentPerTrade, :MaximumPercentLossPerDay
  json.url setting_url(setting, format: :json)
end
