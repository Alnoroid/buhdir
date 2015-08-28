json.array!(@event_prices) do |event_price|
  json.extract! event_price, :id, :event_id, :artist_id, :place_id, :price_id, :custom_name, :custom_description, :cost, :price_from
  json.url event_price_url(event_price, format: :json)
end
