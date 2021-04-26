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

ActiveRecord::Schema.define(version: 2021_04_26_121120) do

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

  create_table "daily_questionnaires", force: :cascade do |t|
    t.string "dayOfWeek", null: false
    t.integer "user_daily_questionnaire_id"
    t.integer "user_mood", null: false
    t.integer "duration_mins", default: 0, null: false
    t.integer "indoor_score", default: 0, null: false
    t.integer "outdoor_score", default: 0, null: false
    t.integer "cardio_score", default: 0, null: false
    t.integer "strength_score", default: 0, null: false
    t.integer "physicality_score", default: 0, null: false
    t.integer "mentality_score", default: 0, null: false
    t.integer "solo_score", default: 0, null: false
    t.integer "team_score", default: 0, null: false
    t.integer "intensity_score", default: 0, null: false
    t.integer "duration_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedback_questionnaires", force: :cascade do |t|
    t.string "dayOfWeek", null: false
    t.integer "user_satisfaction", default: 0, null: false
    t.integer "soreness_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_daily_questionnaires", force: :cascade do |t|
    t.date "questionnaireDate", null: false
    t.integer "user_datum_id", null: false
    t.integer "daily_questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_questionnaire_id"], name: "index_user_daily_questionnaires_on_daily_questionnaire_id"
    t.index ["user_datum_id"], name: "index_user_daily_questionnaires_on_user_datum_id"
  end

  create_table "user_daily_questionnaires_data", id: false, force: :cascade do |t|
    t.integer "user_datum_id", null: false
    t.integer "user_daily_questionnaire_id", null: false
    t.index ["user_daily_questionnaire_id"], name: "user_daily_questionnaire_id_on_user_datum_id_"
    t.index ["user_datum_id"], name: "user_datum_id_on_user_daily_questionnaire_id"
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

  create_table "user_data_feedback_questionnaires", id: false, force: :cascade do |t|
    t.integer "user_datum_id", null: false
    t.integer "user_feedback_questionnaire_id", null: false
    t.index ["user_datum_id"], name: "user_datum_id_on_user_feedback_questionnaire_id"
    t.index ["user_feedback_questionnaire_id"], name: "user_feedback_questionnaire_id_on_user_datum_id_"
  end

  create_table "user_feedback_questionnaires", force: :cascade do |t|
    t.date "questionnaireDate", null: false
    t.integer "user_datum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "feedback_questionnaire_id"
    t.index ["feedback_questionnaire_id"], name: "feedbackQuestionnaireIndex"
    t.index ["user_datum_id"], name: "index_user_feedback_questionnaires_on_user_datum_id"
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
