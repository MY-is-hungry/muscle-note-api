FactoryBot.define do
  factory :exercise do
    association :category
    name { Faker::Games::Pokemon.move }
    user_id { category.user_id }
  end
end
