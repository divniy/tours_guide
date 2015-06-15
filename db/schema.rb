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

ActiveRecord::Schema.define(version: 20150615043315) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true

  create_table "tour_categories", force: :cascade do |t|
    t.integer "tour_id"
    t.integer "category_id"
  end

  add_index "tour_categories", ["category_id"], name: "index_tour_categories_on_category_id"
  add_index "tour_categories", ["tour_id", "category_id"], name: "index_tour_categories_on_tour_id_and_category_id", unique: true
  add_index "tour_categories", ["tour_id"], name: "index_tour_categories_on_tour_id"

  create_table "tour_editings", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tour_editings", ["tour_id"], name: "index_tour_editings_on_tour_id"
  add_index "tour_editings", ["user_id"], name: "index_tour_editings_on_user_id"

  create_table "tours", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tours", ["city_id"], name: "index_tours_on_city_id"
  add_index "tours", ["published"], name: "index_tours_on_published"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
