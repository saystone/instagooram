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

ActiveRecord::Schema.define(version: 2018_04_18_055407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "media", force: :cascade do |t|
    t.string "type"
    t.json "images"
    t.json "videos"
    t.string "filter"
    t.integer "user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "following_id"
    t.integer "follower_id"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.string "profile_picture"
    t.string "bio"
    t.string "website"
  end

end