FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    posts_counter { Faker::Number.non_negative_integer }
  end
end
