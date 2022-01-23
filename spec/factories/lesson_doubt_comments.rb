FactoryBot.define do
  factory :lesson_doubt_comment do
    doubt_id { "" }
    user_id { "" }
    doubt_text { "MyText" }
    answered { false }
  end
end
