json.array!(@contact_types) do |contact_type|
  json.extract! contact_type, :id, :name, :contact_category_id
  json.url contact_type_url(contact_type, format: :json)
end
