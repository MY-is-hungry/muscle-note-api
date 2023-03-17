FactoryBot.define do
  factory :tag do
    name { Faker::Base.regexify("[ぁ-ん]{3}") }
    user_id { Category.first&.user_id || SecureRandom.hex(14) }
  end
end
