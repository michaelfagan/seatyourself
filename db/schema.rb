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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130916212632) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reservations", :force => true do |t|
    t.datetime "begin_time"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "people",        :default => 1
  end

  add_index "reservations", ["restaurant_id"], :name => "index_reservations_on_restaurant_id"
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "picture"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "capacity",    :default => 100
  end

  add_index "restaurants", ["category_id"], :name => "index_restaurants_on_category_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
