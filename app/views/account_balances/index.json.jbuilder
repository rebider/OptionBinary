json.array!(@account_balances) do |account_balance|
  json.extract! account_balance, :id, :BrokerAccount_id, :Amount, :Type, :TradeID
  json.url account_balance_url(account_balance, format: :json)
end
