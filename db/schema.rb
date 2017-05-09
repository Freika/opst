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

ActiveRecord::Schema.define(version: 20170509182916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chosen_heros", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_chosen_heros_on_hero_id", using: :btree
    t.index ["match_id"], name: "index_chosen_heros_on_match_id", using: :btree
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_destinations_on_map_id", using: :btree
    t.index ["match_id"], name: "index_destinations_on_match_id", using: :btree
  end

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "result"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "skill_rating"
    t.integer  "sr_diff",      default: 0,  null: false
    t.integer  "season_id",    default: 0,  null: false
    t.integer  "streak",       default: 1,  null: false
    t.integer  "user_id",      default: 0,  null: false
    t.integer  "number",       default: 0,  null: false
    t.text     "comment",      default: "", null: false
    t.integer  "rounds"
    t.integer  "party_size"
    t.index ["number"], name: "index_matches_on_number", using: :btree
    t.index ["party_size"], name: "index_matches_on_party_size", using: :btree
    t.index ["rounds"], name: "index_matches_on_rounds", using: :btree
    t.index ["season_id"], name: "index_matches_on_season_id", using: :btree
    t.index ["skill_rating"], name: "index_matches_on_skill_rating", using: :btree
    t.index ["sr_diff"], name: "index_matches_on_sr_diff", using: :btree
    t.index ["streak"], name: "index_matches_on_streak", using: :btree
    t.index ["user_id"], name: "index_matches_on_user_id", using: :btree
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "skill_rating"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.integer  "season_id",    null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["draws"], name: "index_qualifications_on_draws", using: :btree
    t.index ["losses"], name: "index_qualifications_on_losses", using: :btree
    t.index ["season_id"], name: "index_qualifications_on_season_id", using: :btree
    t.index ["skill_rating"], name: "index_qualifications_on_skill_rating", using: :btree
    t.index ["user_id"], name: "index_qualifications_on_user_id", using: :btree
    t.index ["wins"], name: "index_qualifications_on_wins", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "finishes_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "battletag"
    t.index ["battletag"], name: "index_users_on_battletag", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
