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

ActiveRecord::Schema.define(version: 20170710004631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "follower_uid"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.string "name"
    t.integer "following_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.integer "org_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orgs_on_user_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.integer "repo_uid"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_repos_on_user_id"
  end

  create_table "starred_repos", force: :cascade do |t|
    t.integer "starred_id"
    t.string "full_name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_starred_repos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "screen_name"
    t.string "uid"
    t.string "oauth_token"
    t.string "oauth_token_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "pic"
  end

  add_foreign_key "followers", "users"
  add_foreign_key "followings", "users"
  add_foreign_key "orgs", "users"
  add_foreign_key "repos", "users"
  add_foreign_key "starred_repos", "users"
end
