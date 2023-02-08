FactoryBot.define do
  factory :note do
    user_id { Category.first&.user_id || SecureRandom.hex(14) }
    content { Faker::Quote.famous_last_words }
    resource_kind { "record" }
    resource_id { Record.ids.sample || create(:record).id }
  end
end
