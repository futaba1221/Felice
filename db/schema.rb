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

ActiveRecord::Schema.define(version: 20200831023237) do

  create_table "birthplaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "footprints", force: :cascade do |t|
    t.string   "visiter_id"
    t.string   "visited_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false, null: false
    t.index ["visited_id"], name: "index_footprints_on_visited_id"
    t.index ["visiter_id"], name: "index_footprints_on_visiter_id"
  end

  create_table "nices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "article"
    t.integer  "user_id"
    t.string   "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "status",      default: false, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "age"
    t.string   "blood"
    t.string   "brother"
    t.string   "prefecture_id"
    t.string   "birthplace_id"
    t.integer  "study"
    t.integer  "job"
    t.string   "money"
    t.string   "height"
    t.string   "figure"
    t.string   "marriage"
    t.string   "children"
    t.string   "purpose"
    t.string   "housework"
    t.string   "request"
    t.string   "housemate"
    t.string   "holiday"
    t.string   "liquor"
    t.string   "tobacco"
    t.text     "hobby"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "memo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.date     "birthday"
    t.string   "gender"
    t.string   "blood"
    t.integer  "stature"
    t.string   "figure"
    t.string   "image_names"
    t.string   "brother"
    t.string   "housing"
    t.string   "birthplace"
    t.string   "study"
    t.string   "job"
    t.string   "money"
    t.string   "prefecture_id"
    t.string   "birthplace_id"
    t.string   "marriage"
    t.string   "children"
    t.string   "intention"
    t.string   "housework"
    t.string   "hope"
    t.string   "housemate"
    t.string   "holiday"
    t.string   "liquor"
    t.string   "tobacco"
    t.string   "like"
    t.text     "self_pr"
    t.date     "deleted_at"
    t.boolean  "status",                 default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
