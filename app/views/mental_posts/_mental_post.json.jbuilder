json.extract! mental_post, :id, :title, :description, :user_id, :created_at, :updated_at
json.url mental_post_url(mental_post, format: :json)
