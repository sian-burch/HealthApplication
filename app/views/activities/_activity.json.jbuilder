json.extract! activity, :id, :name, :duration, :indoor_score, :outdoor_score, :cardio_score, :strength_score, :physicality_score, :mentality_score, :solo_score, :team_score, :intensity_score, :created_at, :updated_at
json.url activity_url(activity, format: :json)
