FactoryBot.define do
  factory :lesson_doubt_comment do
    doubt_id { FactoryBot.create(:lesson_doubt).id }
    user_id { FactoryBot.create(:user).id }
    doubt_text { "is this correct?" }
    answered { false }
  end
end
