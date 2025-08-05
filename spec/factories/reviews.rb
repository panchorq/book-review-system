FactoryBot.define do
    factory :review do
      rating { rand(1..5) }
      content { Faker::Lorem.paragraph(sentence_count: 5) }
      association :user
      association :book
    end
  end