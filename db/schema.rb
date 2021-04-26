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

ActiveRecord::Schema.define(version: 2021_04_26_103636) do

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "duration_mins", null: false
    t.integer "indoor_score", default: 0, null: false
    t.integer "outdoor_score", default: 0, null: false
    t.integer "cardio_score", default: 0, null: false
    t.integer "strength_score", default: 0, null: false
    t.integer "physicality_score", default: 0, null: false
    t.integer "mentality_score", default: 0, null: false
    t.integer "solo_score", default: 0, null: false
    t.integer "team_score", default: 0, null: false
    t.integer "intensity_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_daily_steps", force: :cascade do |t|
    t.integer "age", null: false
    t.integer "minimum", null: false
    t.integer "medium", null: false
    t.integer "high", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_data", force: :cascade do |t|
    t.integer "height", null: false
    t.float "weight", null: false
    t.integer "age", null: false
    t.string "gender", null: false
    t.string "athletic_lvl", null: false
    t.boolean "physical", null: false
    t.boolean "mental", null: false
    t.integer "indoor_score", default: 0, null: false
    t.integer "outdoor_score", default: 0, null: false
    t.integer "frequency_pref", null: false
    t.integer "duration_pref", null: false
    t.float "BMI"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "cardio_score", default: 0, null: false
    t.integer "strength_score", default: 0, null: false
    t.integer "physicality_score", default: 0, null: false
    t.integer "mentality_score", default: 0, null: false
    t.integer "solo_score", default: 0, null: false
    t.integer "team_score", default: 0, null: false
    t.integer "intensity_score", default: 0, null: false
    t.index ["user_id"], name: "index_user_data_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
