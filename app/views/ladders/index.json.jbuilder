json.array!(@ladders) do |ladder|
  json.extract! ladder, :id, :ladder, :player, :status, :result
  json.url ladder_url(ladder, format: :json)
end
