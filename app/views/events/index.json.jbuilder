json.array!(@events) do |event|
  json.extract! event, :id, :name, :place, :place_type, :event_type, :date_start, :date_finish, :date_load, :client, :greeter, :description, :condition
  json.url event_url(event, format: :json)
end
