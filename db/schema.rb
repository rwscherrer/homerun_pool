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

ActiveRecord::Schema.define(version: 20170705230332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allstar_standings", force: :cascade do |t|
    t.string   "team_name"
    t.string   "coach"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "mlb_team"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "home_runs_2016"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "jersey_num"
    t.string   "position"
    t.string   "height"
    t.string   "weight"
    t.string   "birth_date"
    t.integer  "age"
    t.string   "birth_city"
    t.string   "birth_country"
    t.string   "rookie"
    t.integer  "mlb_id"
    t.string   "team_abbr"
    t.string   "team_city"
    t.integer  "games_played"
    t.integer  "home_runs_allowed"
    t.integer  "player_id"
    t.integer  "mlb_team_id"
    t.integer  "home_runs_2017"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "player_1"
    t.string   "player_2"
    t.string   "player_3"
    t.string   "player_4"
    t.string   "player_5"
    t.string   "player_6"
    t.string   "player_7"
    t.string   "player_8"
    t.string   "player_9"
    t.string   "player_1_data", default: [],              array: true
    t.string   "player_2_data", default: [],              array: true
    t.string   "player_3_data", default: [],              array: true
    t.string   "player_4_data", default: [],              array: true
    t.string   "player_5_data", default: [],              array: true
    t.string   "player_6_data", default: [],              array: true
    t.string   "player_7_data", default: [],              array: true
    t.string   "player_8_data", default: [],              array: true
    t.string   "player_9_data", default: [],              array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
