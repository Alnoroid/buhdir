json.array!(@contact_categories) do |contact_category|
  json.extract! contact_category, :id, :name
  json.url contact_category_url(contact_category, format: :json)
end
