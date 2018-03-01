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

ActiveRecord::Schema.define(version: 20180301194118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "photographer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date", null: false
    t.integer "hours", null: false
    t.string "location", null: false
    t.index ["photographer_id"], name: "index_bookings_on_photographer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "photographers", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.string "city"
    t.integer "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "category"
    t.index ["user_id"], name: "index_photographers_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "photographer_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographer_id"], name: "index_photos_on_photographer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "photographers"
  add_foreign_key "bookings", "users"
  add_foreign_key "photographers", "users"
  add_foreign_key "photos", "photographers"
end
