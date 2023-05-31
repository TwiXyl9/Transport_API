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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_203345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "capacities", force: :cascade do |t|
    t.float "width"
    t.float "height"
    t.float "length"
    t.integer "num_of_pallets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "load_capacity"
  end

  create_table "cargo_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.bigint "capacity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tail_type_id", null: false
    t.float "price_per_hour"
    t.float "price_per_kilometer"
    t.index ["capacity_id"], name: "index_cars_on_capacity_id"
    t.index ["tail_type_id"], name: "index_cars_on_tail_type_id"
  end

  create_table "devise_api_tokens", force: :cascade do |t|
    t.string "resource_owner_type", null: false
    t.uuid "resource_owner_id", null: false
    t.string "access_token", null: false
    t.string "refresh_token"
    t.integer "expires_in", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_devise_api_tokens_on_access_token"
    t.index ["previous_refresh_token"], name: "index_devise_api_tokens_on_previous_refresh_token"
    t.index ["refresh_token"], name: "index_devise_api_tokens_on_refresh_token"
    t.index ["resource_owner_type", "resource_owner_id"], name: "index_devise_api_tokens_on_resource_owner"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_additional_services", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "additional_service_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_order_additional_services_on_additional_service_id"
    t.index ["order_id"], name: "index_order_additional_services_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "phone"
    t.string "name"
    t.datetime "date"
    t.integer "stage"
    t.bigint "car_id", null: false
    t.bigint "route_id", null: false
    t.bigint "user_id"
    t.bigint "cargo_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price"
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["cargo_type_id"], name: "index_orders_on_cargo_type_id"
    t.index ["route_id"], name: "index_orders_on_route_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "start_point_id", null: false
    t.bigint "end_point_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_point_id"], name: "index_routes_on_end_point_id"
    t.index ["start_point_id"], name: "index_routes_on_start_point_id"
  end

  create_table "tail_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars", "capacities"
  add_foreign_key "cars", "tail_types"
  add_foreign_key "order_additional_services", "additional_services"
  add_foreign_key "order_additional_services", "orders"
  add_foreign_key "orders", "cargo_types"
  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "routes"
  add_foreign_key "orders", "users"
  add_foreign_key "routes", "points", column: "end_point_id"
  add_foreign_key "routes", "points", column: "start_point_id"
end
