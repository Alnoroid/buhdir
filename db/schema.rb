# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150824030825) do

  create_table "artists", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.string   "image",             limit: 255
    t.integer  "price_category_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.text     "notes",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contact_categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "contact_types", force: :cascade do |t|
    t.string  "name",                limit: 255
    t.integer "contact_category_id", limit: 4
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "contact_name",    limit: 255
    t.string   "address",         limit: 255
    t.string   "w_contact",       limit: 255
    t.string   "web_address",     limit: 255
    t.string   "email",           limit: 255
    t.text     "description",     limit: 65535
    t.text     "special",         limit: 65535
    t.string   "fee",             limit: 255
    t.string   "phone1",          limit: 255
    t.string   "phone2",          limit: 255
    t.integer  "rating",          limit: 4
    t.boolean  "publish",         limit: 1
    t.datetime "publish_date"
    t.boolean  "hot",             limit: 1
    t.integer  "user_id",         limit: 4
    t.integer  "contact_type_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "event_curator_users", force: :cascade do |t|
    t.integer "event_id", limit: 4
    t.integer "user_id",  limit: 4
    t.string  "custom",   limit: 255
  end

  create_table "event_prices", force: :cascade do |t|
    t.integer "event_id",           limit: 4
    t.integer "artist_id",          limit: 4
    t.integer "place_id",           limit: 4
    t.integer "price_id",           limit: 4
    t.string  "custom_name",        limit: 255
    t.text    "custom_description", limit: 65535
    t.integer "price",              limit: 4
    t.boolean "price_from",         limit: 1
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "place",       limit: 255
    t.string   "place_type",  limit: 255
    t.string   "event_type",  limit: 255
    t.datetime "date_start"
    t.datetime "date_finish"
    t.datetime "date_load"
    t.integer  "client_id",   limit: 4
    t.string   "greeter",     limit: 255
    t.text     "description", limit: 65535
    t.string   "condition",   limit: 255
    t.string   "guests",      limit: 255
  end

  create_table "places", force: :cascade do |t|
    t.text     "title",             limit: 65535
    t.text     "description",       limit: 65535
    t.string   "phone",             limit: 255
    t.string   "presentation",      limit: 255
    t.string   "image",             limit: 255
    t.integer  "price_category_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "price_categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "prices", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.integer  "price1",             limit: 4
    t.integer  "price2",             limit: 4
    t.integer  "price_category_id",  limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.boolean  "property",           limit: 1
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "title",       limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.text     "the_role",    limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",             limit: 255,   null: false
    t.string   "crypted_password",     limit: 255
    t.string   "salt",                 limit: 255
    t.string   "email",                limit: 255
    t.string   "name",                 limit: 255
    t.string   "surname",              limit: 255
    t.integer  "salary",               limit: 4
    t.integer  "role_id",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userpic_file_name",    limit: 255
    t.string   "userpic_content_type", limit: 255
    t.integer  "userpic_file_size",    limit: 4
    t.datetime "userpic_updated_at"
    t.string   "phone",                limit: 255
    t.text     "notes",                limit: 65535
    t.date     "birth_date"
    t.date     "employ_date"
    t.boolean  "deleted",              limit: 1
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
