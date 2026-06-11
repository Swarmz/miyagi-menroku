# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_11_035529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "shops", force: :cascade do |t|
    t.string "address", null: false
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.index ["city"], name: "index_shops_on_city"
    t.index ["name", "city"], name: "index_shops_on_name_and_city", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "menu_item", null: false
    t.text "notes"
    t.integer "rating", null: false
    t.bigint "shop_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.date "visited_on", null: false
    t.index ["rating"], name: "index_visits_on_rating"
    t.index ["shop_id", "visited_on"], name: "index_visits_on_shop_id_and_visited_on"
    t.index ["shop_id"], name: "index_visits_on_shop_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "visits", "shops"
  add_foreign_key "visits", "users"
end
