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

ActiveRecord::Schema.define(version: 2018_11_15_224948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "album_title", null: false
    t.integer "year", null: false
    t.integer "band_id", null: false
    t.boolean "live", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_title"], name: "index_albums_on_album_title", unique: true
    t.index ["band_id"], name: "index_albums_on_band_id"
    t.index ["year"], name: "index_albums_on_year"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_bands_on_name", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.string "track_title", null: false
    t.integer "ord", null: false
    t.boolean "regular", null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ord"], name: "index_tracks_on_ord"
    t.index ["regular"], name: "index_tracks_on_regular"
    t.index ["track_title"], name: "index_tracks_on_track_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
