json.array!(@broker_accounts) do |broker_account|
  json.extract! broker_account, :id, :name, :user_id, :broker_id
  json.url broker_account_url(broker_account, format: :json)
end
