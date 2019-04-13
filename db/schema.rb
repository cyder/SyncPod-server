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

ActiveRecord::Schema.define(version: 20190413024022) do

  create_table "ban_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "target_id"
    t.bigint "reporter_id"
    t.bigint "room_id"
    t.datetime "expiration_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reporter_id"], name: "index_ban_reports_on_reporter_id"
    t.index ["room_id"], name: "index_ban_reports_on_room_id"
    t.index ["target_id"], name: "index_ban_reports_on_target_id"
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "room_id", null: false
    t.string "chat_type", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "recommend_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_recommend_rooms_on_room_id"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name", null: false
    t.string "key", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false, null: false
    t.bigint "create_user_id"
    t.index ["create_user_id"], name: "index_rooms_on_create_user_id"
    t.index ["key"], name: "index_rooms_on_key"
  end

  create_table "user_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "user_id"
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_reports_on_user_id"
  end

  create_table "user_room_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "entry_at", null: false
    t.datetime "exit_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", limit: 36
    t.text "ip_address"
    t.index ["room_id"], name: "index_user_room_logs_on_room_id"
    t.index ["user_id"], name: "index_user_room_logs_on_user_id"
    t.index ["uuid"], name: "index_user_room_logs_on_uuid"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "self_introduction"
    t.string "icon"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "room_id", null: false
    t.string "youtube_video_id", null: false
    t.string "title"
    t.string "channel_title"
    t.string "thumbnail_url"
    t.string "duration"
    t.text "description"
    t.datetime "published"
    t.datetime "video_start_time", null: false
    t.datetime "video_end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "add_user_id", null: false
    t.bigint "view_count"
    t.index ["add_user_id"], name: "index_videos_on_add_user_id"
    t.index ["room_id"], name: "index_videos_on_room_id"
    t.index ["video_start_time"], name: "index_videos_on_video_start_time"
  end

  add_foreign_key "chats", "users"
  add_foreign_key "recommend_rooms", "rooms"
  add_foreign_key "rooms", "users", column: "create_user_id"
  add_foreign_key "videos", "rooms"
  add_foreign_key "videos", "users", column: "add_user_id"
end
