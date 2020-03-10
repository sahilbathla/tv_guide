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

ActiveRecord::Schema.define(version: 2020_03_10_194720) do

  create_table "channels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_tv_shows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tv_show_id"
    t.boolean "reminder_set", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_favorite_tv_shows_on_tv_show_id"
    t.index ["user_id"], name: "index_favorite_tv_shows_on_user_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "channel_id"
    t.string "start_at"
    t.string "end_at"
    t.string "repeats_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_tv_shows_on_channel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
