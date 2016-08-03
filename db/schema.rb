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

ActiveRecord::Schema.define(version: 20160804192417) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.integer  "member_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "assemblies", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "constituencies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name_cy",    limit: 255
  end

  create_table "debates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "log_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
    t.string   "tv",         limit: 255
    t.string   "name_cy",    limit: 255
    t.string   "tv_cy",      limit: 255
  end

  create_table "members", force: :cascade do |t|
    t.string   "forename",    limit: 255
    t.string   "surname",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "external_id", limit: 4
    t.string   "slug",        limit: 255
    t.string   "photo_id",    limit: 255
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "member_id",  limit: 4
    t.integer  "party_id",   limit: 4
    t.date     "log_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representations", force: :cascade do |t|
    t.integer  "member_id",       limit: 4
    t.integer  "constituency_id", limit: 4
    t.date     "log_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "end_log_date"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "member_id",    limit: 4
    t.integer  "position_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "log_date"
    t.date     "end_log_date"
  end

  create_table "speeches", force: :cascade do |t|
    t.integer  "member_id",  limit: 4
    t.integer  "debate_id",  limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "log_date"
    t.text     "content_cy", limit: 65535
    t.string   "tv",         limit: 255
    t.datetime "spoke_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
