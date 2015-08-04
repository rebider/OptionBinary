json.array!(@trades) do |trade|
  json.extract! trade, :id, :User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest
  json.url trade_url(trade, format: :json)
end
