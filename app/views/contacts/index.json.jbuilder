json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :contact_name, :address, :w_contact, :web_address, :email, :description, :special, :fee, :phone1, :phone2, :rating, :publish, :publish_date, :hot, :user_id, :contact_type_id
  json.url contact_url(contact, format: :json)
end
