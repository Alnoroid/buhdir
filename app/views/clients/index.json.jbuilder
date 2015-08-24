json.array!(@clients) do |client|
  json.extract! client, :id, :name, :phone, :email, :notes
  json.url client_url(client, format: :json)
end
