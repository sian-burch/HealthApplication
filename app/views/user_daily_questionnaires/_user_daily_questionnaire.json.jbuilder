json.extract! user_daily_questionnaire, :id, :questionnaireDate, :created_at, :updated_at
json.url user_daily_questionnaire_url(user_daily_questionnaire, format: :json)
