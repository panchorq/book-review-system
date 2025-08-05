FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      banned { false }
    end
  end