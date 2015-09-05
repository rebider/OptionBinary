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

ActiveRecord::Schema.define(version: 20150905025917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_balances", force: :cascade do |t|
    t.string   "Type"
    t.string   "TradeID"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "Balance"
    t.integer  "broker_account_id"
    t.integer  "user_id"
    t.float    "Amount"
  end

  add_index "account_balances", ["broker_account_id"], name: "index_account_balances_on_broker_account_id", using: :btree
  add_index "account_balances", ["user_id"], name: "index_account_balances_on_user_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "azzets", force: :cascade do |t|
    t.string   "Type"
    t.string   "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "broker_accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "broker_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "DemoAccount"
    t.float    "Balance"
  end

  add_index "broker_accounts", ["broker_id"], name: "index_broker_accounts_on_broker_id", using: :btree
  add_index "broker_accounts", ["user_id"], name: "index_broker_accounts_on_user_id", using: :btree

  create_table "brokers", force: :cascade do |t|
    t.string   "Name"
    t.string   "Url"
    t.string   "Image"
    t.string   "Regulated"
    t.string   "MinimumDeposit"
    t.string   "MinimumAmountTrade"
    t.string   "MaximunAmountTrade"
    t.string   "Expirations"
    t.string   "DemoAccount"
    t.string   "USAFriendly"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "MaximumTradesPerDay"
    t.string   "MaximumPercentPerTrade"
    t.string   "MaximumPercentLossPerDay"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id", using: :btree

  create_table "strategies", force: :cascade do |t|
    t.string   "Name"
    t.string   "Type"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "strategies", ["User_id"], name: "index_strategies_on_User_id", using: :btree

  create_table "trades", force: :cascade do |t|
    t.integer  "User_id"
    t.integer  "Strategy_id"
    t.string   "Option"
    t.string   "Amount"
    t.string   "OnProfit"
    t.string   "OnLoss"
    t.string   "Payout"
    t.string   "Result"
    t.string   "UseMartingale"
    t.string   "UseCompoundInterest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "Azzet_id"
    t.integer  "BrokerAccount_id"
    t.string   "Position"
  end

  add_index "trades", ["Azzet_id"], name: "index_trades_on_Azzet_id", using: :btree
  add_index "trades", ["BrokerAccount_id"], name: "index_trades_on_BrokerAccount_id", using: :btree
  add_index "trades", ["Strategy_id"], name: "index_trades_on_Strategy_id", using: :btree
  add_index "trades", ["User_id"], name: "index_trades_on_User_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
