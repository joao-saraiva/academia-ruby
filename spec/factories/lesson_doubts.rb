FactoryBot.define do
  factory :lesson_doubt do
    lesson_id { FactoryBot.create(:lesson).id }
  end
end
