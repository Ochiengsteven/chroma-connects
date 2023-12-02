FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    comments_counter { Faker::Number.non_negative_integer }
    likes_counter { Faker::Number.non_negative_integer }
    association :author, factory: :user
  end
end
