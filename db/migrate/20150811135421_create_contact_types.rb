class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string :name
      t.integer :contact_category_id
    end
  end
end
