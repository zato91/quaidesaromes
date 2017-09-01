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

ActiveRecord::Schema.define(version: 20160525151445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_games", force: :cascade do |t|
    t.integer  "question_game_id"
    t.integer  "answer_id"
    t.boolean  "good_answer"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "wine_id"
  end

  add_index "answer_games", ["answer_id"], name: "index_answer_games_on_answer_id", using: :btree
  add_index "answer_games", ["question_game_id"], name: "index_answer_games_on_question_game_id", using: :btree
  add_index "answer_games", ["wine_id"], name: "index_answer_games_on_wine_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "value"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "wine_color"
    t.boolean  "good_answer"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "aromas", force: :cascade do |t|
    t.string   "name"
    t.string   "family"
    t.string   "sub_family"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "game_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_suspects", force: :cascade do |t|
    t.integer  "suspect_id"
    t.integer  "wine_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_user_id"
    t.integer  "position"
    t.integer  "aroma_id"
  end

  add_index "game_suspects", ["aroma_id"], name: "index_game_suspects_on_aroma_id", using: :btree
  add_index "game_suspects", ["game_user_id"], name: "index_game_suspects_on_game_user_id", using: :btree
  add_index "game_suspects", ["suspect_id"], name: "index_game_suspects_on_suspect_id", using: :btree
  add_index "game_suspects", ["wine_id"], name: "index_game_suspects_on_wine_id", using: :btree

  create_table "game_user_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_user_id"
    t.integer  "score",             default: 0
    t.boolean  "win"
    t.boolean  "finished",          default: false
    t.string   "session_password"
    t.string   "session_profile"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "provisional_score", default: 0
    t.integer  "final_score",       default: 0
    t.float    "rating"
    t.string   "team_name"
  end

  add_index "game_user_sessions", ["game_user_id"], name: "index_game_user_sessions_on_game_user_id", using: :btree
  add_index "game_user_sessions", ["user_id"], name: "index_game_user_sessions_on_user_id", using: :btree

  create_table "game_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "score",        default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "finished",     default: false
    t.string   "password"
    t.string   "company_name"
  end

  add_index "game_users", ["game_id"], name: "index_game_users_on_game_id", using: :btree
  add_index "game_users", ["user_id"], name: "index_game_users_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "wine_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "game_category_id"
  end

  add_index "games", ["game_category_id"], name: "index_games_on_game_category_id", using: :btree
  add_index "games", ["wine_id"], name: "index_games_on_wine_id", using: :btree

  create_table "question_games", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "position"
    t.integer  "game_user_id"
    t.integer  "wine_id"
  end

  add_index "question_games", ["game_user_id"], name: "index_question_games_on_game_user_id", using: :btree
  add_index "question_games", ["question_id"], name: "index_question_games_on_question_id", using: :btree
  add_index "question_games", ["wine_id"], name: "index_question_games_on_wine_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.string   "typ"
    t.string   "theme"
    t.string   "tips"
    t.string   "wine_color"
  end

  create_table "suspects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasting_aromas", force: :cascade do |t|
    t.integer  "aroma_id"
    t.integer  "tasting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasting_aromas", ["aroma_id"], name: "index_tasting_aromas_on_aroma_id", using: :btree
  add_index "tasting_aromas", ["tasting_id"], name: "index_tasting_aromas_on_tasting_id", using: :btree

  create_table "tastings", force: :cascade do |t|
    t.integer  "wine_id"
    t.string   "taster_name"
    t.date     "tasting_date"
    t.string   "color"
    t.integer  "sweetness"
    t.integer  "acidity"
    t.integer  "tannins"
    t.integer  "alcohol"
    t.integer  "body"
    t.integer  "length"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tastings", ["wine_id"], name: "index_tastings_on_wine_id", using: :btree

  create_table "user_answers", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "question_game_id"
    t.integer  "answer_game_id"
    t.integer  "game_user_session_id"
    t.boolean  "joker_user"
  end

  add_index "user_answers", ["answer_game_id"], name: "index_user_answers_on_answer_game_id", using: :btree
  add_index "user_answers", ["game_user_session_id"], name: "index_user_answers_on_game_user_session_id", using: :btree
  add_index "user_answers", ["question_game_id"], name: "index_user_answers_on_question_game_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wines", force: :cascade do |t|
    t.string   "estate"
    t.string   "cuvee"
    t.string   "label"
    t.string   "region"
    t.string   "country"
    t.string   "vintage"
    t.string   "grape_varieties"
    t.string   "color"
    t.integer  "volume"
    t.string   "tasting_color"
    t.string   "aromas_family"
    t.integer  "sweetness"
    t.integer  "acidity"
    t.integer  "tannins"
    t.integer  "alcohol"
    t.integer  "body"
    t.integer  "length"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "alcohol_percentage"
  end

  add_foreign_key "answer_games", "answers"
  add_foreign_key "answer_games", "question_games"
  add_foreign_key "answer_games", "wines"
  add_foreign_key "answers", "questions"
  add_foreign_key "game_suspects", "aromas"
  add_foreign_key "game_suspects", "game_users"
  add_foreign_key "game_suspects", "suspects"
  add_foreign_key "game_suspects", "wines"
  add_foreign_key "game_user_sessions", "game_users"
  add_foreign_key "game_user_sessions", "users"
  add_foreign_key "game_users", "games"
  add_foreign_key "game_users", "users"
  add_foreign_key "games", "game_categories"
  add_foreign_key "games", "wines"
  add_foreign_key "question_games", "game_users"
  add_foreign_key "question_games", "questions"
  add_foreign_key "question_games", "wines"
  add_foreign_key "tasting_aromas", "aromas"
  add_foreign_key "tasting_aromas", "tastings"
  add_foreign_key "tastings", "wines"
  add_foreign_key "user_answers", "answer_games"
  add_foreign_key "user_answers", "game_user_sessions"
  add_foreign_key "user_answers", "question_games"
end
