json.array!(@pings) do |ping|
  json.extract! ping, :id, :server, :player, :ping
  json.url ping_url(ping, format: :json)
end
