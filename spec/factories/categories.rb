FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 5) }
    user_id { SecureRandom.hex(14) } # 架空のuser_id
  end
end