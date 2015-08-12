json.array!(@prices) do |price|
  json.extract! price, :id, :title, :description, :price1, :price2, :price_category_id
  json.url price_url(price, format: :json)
end
