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

ActiveRecord::Schema.define(version: 20170917150539) do

  create_table "bollywoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "o1"
    t.string "o2"
    t.string "o3"
    t.string "o4"
    t.string "correctans"
    t.boolean "MultiChoice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "o1"
    t.string "o2"
    t.string "o3"
    t.string "o4"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "MultiChoice"
  end

  create_table "footballs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "o1"
    t.string "o2"
    t.string "o3"
    t.string "o4"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "MultiChoice"
  end

  create_table "hollywoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "o1"
    t.string "o2"
    t.string "o3"
    t.string "o4"
    t.string "correctans"
    t.boolean "MultiChoice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "Cscore", default: 0
    t.integer "Fscore", default: 0
    t.integer "Bscore", default: 0
    t.integer "Hscore", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "maxc", default: 0
    t.integer "maxf", default: 0
    t.integer "maxb", default: 0
    t.integer "maxh", default: 0
    t.integer "curc", default: 0
    t.integer "curf", default: 0
    t.integer "curb", default: 0
    t.integer "curh", default: 0
    t.boolean "crikcheck", default: false
    t.boolean "footcheck", default: false
    t.boolean "bollycheck", default: false
    t.boolean "hollycheck", default: false
    t.index ["user_id"], name: "index_leaderboards_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leaderboards", "users"
end
