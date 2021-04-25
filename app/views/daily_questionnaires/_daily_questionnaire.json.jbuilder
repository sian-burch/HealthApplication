json.extract! daily_questionnaire, :id, :dayOfWeek, :user_mood, :duration_mins, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :team_score, :intensity_score, :duration_score, :created_at, :updated_at
json.url daily_questionnaire_url(daily_questionnaire, format: :json)
