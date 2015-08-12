json.array!(@price_categories) do |price_category|
  json.extract! price_category, :id, :name
  json.url price_category_url(price_category, format: :json)
end
