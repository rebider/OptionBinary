json.array!(@azzets) do |azzet|
  json.extract! azzet, :id, :Type, :Name
  json.url azzet_url(azzet, format: :json)
end
