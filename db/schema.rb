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

ActiveRecord::Schema.define(version: 20150702105931) do

  create_table "conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fellowships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "fellowships", ["followed_id"], name: "index_fellowships_on_followed_id", using: :btree
  add_index "fellowships", ["follower_id", "followed_id"], name: "index_fellowships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "fellowships", ["follower_id"], name: "index_fellowships_on_follower_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",         limit: 65535
    t.integer  "author_id",       limit: 4
    t.integer  "conversation_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["author_id"], name: "index_messages_on_author_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "username",   limit: 255,   null: false
    t.string   "real_name",  limit: 255,   null: false
    t.text     "bio",        limit: 65535
    t.string   "website",    limit: 255
    t.integer  "country_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "profiles", ["country_id"], name: "index_profiles_on_country_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.text     "message",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "user_conversations", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "conversation_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_conversations", ["conversation_id"], name: "index_user_conversations_on_conversation_id", using: :btree
  add_index "user_conversations", ["user_id"], name: "index_user_conversations_on_user_id", using: :btree

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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "messages", "conversations"
  add_foreign_key "profiles", "countries"
  add_foreign_key "profiles", "users"
  add_foreign_key "tweets", "users"
  add_foreign_key "user_conversations", "conversations"
  add_foreign_key "user_conversations", "users"
end
