json.extract! user_datum, :id, :height, :weight, :age, :gender, :athletic_lvl, :physical, :mental, :indoor, :outdoor, :meditation, :running, :walking, :frequency_pref, :duration_pref, :BMI, :created_at, :updated_at
json.url user_datum_url(user_datum, format: :json)
