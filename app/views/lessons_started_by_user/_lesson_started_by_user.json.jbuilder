json.extract! lesson_started_by_user, :id, :user_id, :lesson_id, :completed, :created_at, :updated_at
json.url lesson_started_by_user_url(lesson_started_by_user, format: :json)
