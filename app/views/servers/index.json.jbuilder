json.array!(@servers) do |server|
  json.extract! server, :id, :server, :port, :name, :description
  json.url server_url(server, format: :json)
end
