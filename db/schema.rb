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

ActiveRecord::Schema[8.0].define(version: 2025_02_24_032639) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "number", null: false
    t.string "complement"
    t.string "neighborhood"
    t.string "city", null: false
    t.string "state", null: false
    t.string "postal_code", null: false
    t.string "country", default: "Brasil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "franchises", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", null: false
    t.string "logo"
    t.string "slug"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["cnpj"], name: "index_franchises_on_cnpj", unique: true
    t.index ["slug"], name: "index_franchises_on_slug", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "cnpj", null: false
    t.string "slug", null: false
    t.boolean "active", default: true
    t.bigint "franchise_id", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_stores_on_address_id"
    t.index ["franchise_id"], name: "index_stores_on_franchise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.string "foto"
    t.string "phone"
    t.string "role", null: false
    t.boolean "active", default: true
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "stores", "addresses"
  add_foreign_key "stores", "franchises"
  add_foreign_key "users", "stores"
end
