FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email }
        password{ 'Confidencial'}
        password_confirmation{ 'Confidencial' }
    end
end