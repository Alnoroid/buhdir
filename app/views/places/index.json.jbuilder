json.array!(@places) do |place|
  json.extract! place, :id, :title, :description, :phone, :presentation, :image, :price_category_id
  json.url place_url(place, format: :json)
end
