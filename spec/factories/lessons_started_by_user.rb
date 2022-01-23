FactoryBot.define do
  factory :lesson_started_by_user do
    user_id { FactoryBot.create(:user).id }
    lesson_id { FactoryBot.create(:lesson).id }
    completed { false }
  end
end
