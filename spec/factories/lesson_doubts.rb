FactoryBot.define do
  factory :lesson_doubt do
    lesson_id { FactoryBot.create(:lesson).id }
    name { 'Doubt 1' }
    description { 'cant get it' }
  end
end
