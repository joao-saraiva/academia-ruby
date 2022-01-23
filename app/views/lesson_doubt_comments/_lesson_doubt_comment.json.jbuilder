json.extract! lesson_doubt_comment, :id, :doubt_id, :user_id, :doubt_text, :answered, :created_at, :updated_at
json.url lesson_doubt_comment_url(lesson_doubt_comment, format: :json)
