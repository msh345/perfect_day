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

ActiveRecord::Schema.define(version: 20131020171836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "author"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itineraries", force: true do |t|
    t.string   "name",                   null: false
    t.integer  "vote_count", default: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itineraries", ["user_id"], name: "index_itineraries_on_user_id", using: :btree

  create_table "itinerary_spots", force: true do |t|
    t.integer  "itinerary_id"
    t.integer  "spot_id"
    t.text     "description"
    t.integer  "vote_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itinerary_spots", ["itinerary_id"], name: "index_itinerary_spots_on_itinerary_id", using: :btree
  add_index "itinerary_spots", ["spot_id"], name: "index_itinerary_spots_on_spot_id", using: :btree

  create_table "spots", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "locale"
    t.string   "location"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
