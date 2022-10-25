require 'date'

def seed_attributes
  id = 1
  daily_memos = ['最高のコンディションだった', 'まずまずのコンディションだった', 'イマイチなコンディションだった']

  {
    daily_record: [
      {memo: daily_memos[rand(0..2)], recorded_on: Date.today.days_ago(8), user_id: id},
      {memo: daily_memos[rand(0..2)], recorded_on: Date.today.days_ago(6), user_id: id},
      {memo: daily_memos[rand(0..2)], recorded_on: Date.today.days_ago(5), user_id: id},
      {memo: daily_memos[rand(0..2)], recorded_on: Date.today.days_ago(2), user_id: id},
      {memo: daily_memos[rand(0..2)], recorded_on: Date.today.days_since(3), user_id: id},
    ],
  }
end

DailyRecord.create(seed_attributes[:daily_record])

