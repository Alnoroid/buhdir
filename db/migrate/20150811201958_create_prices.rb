class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :title
      t.text :description
      t.integer :price1
      t.integer :price2
      t.integer :price_category_id

      t.timestamps null: false
    end
  end
end
