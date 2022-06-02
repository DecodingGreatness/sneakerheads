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

ActiveRecord::Schema.define(version: 2022_06_02_063945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "buyer_content"
    t.text "seller_content"
    t.integer "seller_rating"
    t.integer "buyer_rating"
    t.bigint "transaction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_reviews_on_transaction_id"
  end

  create_table "sneakers", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "price"
    t.integer "size"
    t.string "condition"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "verified", default: false
    t.index ["user_id"], name: "index_sneakers_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sneaker_id", null: false
    t.bigint "traded_sneaker_id"
    t.bigint "buyer_id", null: false
    t.bigint "seller_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
    t.index ["sneaker_id"], name: "index_transactions_on_sneaker_id"
    t.index ["traded_sneaker_id"], name: "index_transactions_on_traded_sneaker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "username"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "transactions"
  add_foreign_key "sneakers", "users"
  add_foreign_key "transactions", "sneakers"
  add_foreign_key "transactions", "sneakers", column: "traded_sneaker_id"
  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "seller_id"
end
