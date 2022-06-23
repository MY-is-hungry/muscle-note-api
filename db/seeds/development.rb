require 'date'

# 開発用ユーザー
def dev_user
  User.first
end

def seed_attributes
  user = dev_user
  daily_notes = ['最高のコンディションだった', 'まずまずのコンディションだった', 'イマイチなコンディションだった']
  event_notes = ['フォーム意識', 'いつもより重く感じた', '重量意識']
  set_notes = ['フォーム崩れあり', 'チートあり', '余裕あり']


  {
    category: [
      {name: '胸', user_id: user.id}, 
      {name: '背中', user_id: user.id}, 
      {name: '脚', user_id: user.id}, 
      {name: '二頭筋', user_id: user.id}, 
      {name: '三頭筋', user_id: user.id}, 
      {name: '肩', user_id: user.id}, 
    ],
    event: [
      {name: 'ベンチプレス', category_id: 1, user_id: user.id}, 
      {name: 'デッドリフト', category_id: 2, user_id: user.id}, 
      {name: 'スクワット', category_id: 3, user_id: user.id}, 
      {name: 'バーベルカール', category_id: 4, user_id: user.id}, 
      {name: 'プッシュダウン', category_id: 5, user_id: user.id}, 
      {name: 'サイドレイズ', category_id: 6, user_id: user.id}, 
    ],
    daily_record: [
      {note: daily_notes[rand(0..2)], recorded_on: Date.today.days_ago(2), user_id: user.id},
      {note: daily_notes[rand(0..2)], recorded_on: Date.today.days_ago(5), user_id: user.id}, 
      {note: daily_notes[rand(0..2)], recorded_on: Date.today.days_ago(6), user_id: user.id}, 
      {note: daily_notes[rand(0..2)], recorded_on: Date.today.days_ago(8), user_id: user.id}, 
      {note: daily_notes[rand(0..2)], recorded_on: Date.today.days_since(3), user_id: user.id}, 
    ],
    event_record: [
      {note: event_notes[rand(0..2)], event_id: rand(0..2)},
      {note: event_notes[rand(0..2)], event_id: rand(3..5)},
    ],
    training_set: [
      {note: set_notes[rand(0..2)], weight: 50, reps: 12},
      {note: set_notes[rand(0..2)], weight: 60, reps: 12},
      {note: set_notes[rand(0..2)], weight: 70, reps: 12},
    ],
  }
end

def genUser
  User.create(name: ENV['DEV_USER_NAME'], email: ENV['DEV_USER_EMAIL'], fb_uid: ENV['DEV_USER_FB_UID'])
end

def genCategory
  Category.create(seed_attributes[:category])
end

def genEvent
  Event.create(seed_attributes[:event])
end

def genRecord
  user = dev_user
  daily_records = DailyRecord.create(seed_attributes[:daily_record])
end

def genEventRecord
  daily_records = DailyRecord.all

  daily_records.each { |daily_record|
    formatted_attributes = seed_attributes[:event_record].map { _1.merge({recorded_on: daily_record.recorded_on}) }
    daily_record.event_records.create(formatted_attributes)
  }
end

def genTrainingSet
  event_records = EventRecord.all

  event_records.each { |event_record|
    formatted_attributes = seed_attributes[:training_set].map { _1.merge({volume: _1[:weight] * _1[:reps]}) }
    training_sets = event_record.training_sets.create(formatted_attributes)
    event_record.update(volume: training_sets.sum {_1.volume})
  }
end

# 生成メソッド実行
ActiveRecord::Base.transaction do
  genUser
  genCategory
  genEvent
  genRecord
  genEventRecord
  genTrainingSet
end