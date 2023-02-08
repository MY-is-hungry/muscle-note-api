FactoryBot.define do
  factory :daily_note do
    user_id { Category.first&.user_id || SecureRandom.hex(14) }
    content { Faker::Quote.famous_last_words }
    # ユニーク制約にかからないようシーケンス値を使用
    sequence(:recorded_on) { |n| Date.today - n }
  end
end
