class CreateContactCategories < ActiveRecord::Migration
  def change
    create_table :contact_categories do |t|
      t.string :name
    end
  end
end
