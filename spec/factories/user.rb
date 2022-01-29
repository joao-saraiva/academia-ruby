FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email }
        password{ 'Confidencial'}
        password_confirmation{ 'Confidencial' }
        cpf {'111-111-111.11'}

        trait :with_lesson do 
            after(:create) do |user|
                FactoryBot.create(:lesson_started_by_user, user_id: user.id)
            end
        end
    end
end