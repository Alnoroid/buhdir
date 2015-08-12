json.array!(@event_curator_users) do |event_curator_user|
  json.extract! event_curator_user, :id, :event_id, :user_id
  json.url event_curator_user_url(event_curator_user, format: :json)
end
