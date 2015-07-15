json.array!(@strategies) do |strategy|
  json.extract! strategy, :id, :Name, :Type, :User_id
  json.url strategy_url(strategy, format: :json)
end
