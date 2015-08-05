class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :email
      t.string :name
      t.string :surname
      t.integer :salary
      t.string :userpic
      t.integer :role_id

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end