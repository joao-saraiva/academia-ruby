FactoryBot.define do
  factory :lesson_started_by_user do
    user_id { "" }
    lesson_id { "" }
    completed { false }
  end
end
