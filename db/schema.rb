# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_150619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_transactions", force: :cascade do |t|
    t.decimal "amount"
    t.string "transaction_number"
    t.string "description"
    t.bigint "transaction_type_id"
    t.bigint "origin_bank_account_id"
    t.bigint "destination_bank_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destination_bank_account_id"], name: "index_account_transactions_on_destination_bank_account_id"
    t.index ["origin_bank_account_id"], name: "index_account_transactions_on_origin_bank_account_id"
    t.index ["transaction_type_id"], name: "index_account_transactions_on_transaction_type_id"
  end

  create_table "account_types", force: :cascade do |t|
    t.string "title"
    t.decimal "min_deposit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.decimal "balance", default: "0.0"
    t.string "currency"
    t.string "account_number"
    t.bigint "client_id"
    t.bigint "account_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_type_id"], name: "index_bank_accounts_on_account_type_id"
    t.index ["client_id"], name: "index_bank_accounts_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "identity"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_clients", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_user_clients_on_client_id"
    t.index ["user_id"], name: "index_user_clients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "account_transactions", "bank_accounts", column: "destination_bank_account_id"
  add_foreign_key "account_transactions", "bank_accounts", column: "origin_bank_account_id"
  add_foreign_key "account_transactions", "transaction_types"
  add_foreign_key "bank_accounts", "account_types"
  add_foreign_key "bank_accounts", "clients"
  add_foreign_key "user_clients", "clients"
  add_foreign_key "user_clients", "users"
end
