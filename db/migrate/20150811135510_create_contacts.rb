class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :contact_name
      t.string :address
      t.string :w_contact
      t.string :web_address
      t.string :email
      t.string :description
      t.string :special
      t.string :fee
      t.string :phone1
      t.string :phone2
      t.integer :rating
      t.binary :publish
      t.datetime :publish_date
      t.binary :hot
      t.integer :user_id
      t.integer :contact_type_id

      t.timestamps null: false
    end
  end
end
