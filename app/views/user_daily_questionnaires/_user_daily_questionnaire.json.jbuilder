json.extract! user_daily_questionnaire, :id, :day_of_week, :questionnaire_date, :user_mood, :duration_mins, :duration_score, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score, :created_at, :updated_at
json.url user_daily_questionnaire_url(user_daily_questionnaire, format: :json)
