FactoryBot.define do
  factory :record do
    transient do
      timezone_from { Time.zone.parse('2023-01-01 00:00:00') }
      timezone_to { Time.zone.parse('2023-12-31 00:00:00') }
      weight_list { [1, 5, 20, 40, 80, 200, 1000] }
      rep_list { [1, 5, 10, 20, 30, 100] }
    end

    association :exercise
    user_id { exercise.user_id }
    executed_on { rand(timezone_from..timezone_to) }
    weight { weight_list.sample }
    rep { rep_list.sample }

    trait :blank_weight do
      weight { nil }
    end
    trait :blank_rep do
      rep { nil }
    end
    trait :blank_record do
      weight { nil }
      rep { nil }
    end

  end
end
