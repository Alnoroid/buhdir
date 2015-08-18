json.array!(@artists) do |artist|
  json.extract! artist, :id, :title, :description, :image, :price_category_id
  json.url artist_url(artist, format: :json)
end
