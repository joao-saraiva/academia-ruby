FactoryBot.define do 
    factory :user do 
        email { Faker::Internet.email }
        password{ 'Confidencial'}
        password_confirmation{ 'Confidencial' }
        cpf {'111-111-111.11'}
    end
end