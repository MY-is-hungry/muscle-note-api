def seed_attributes
  record_memos = ['フォーム意識', 'いつもより重く感じた', '重量意識']

  {
    record: [
      {memo: record_memos[rand(0..2)], event_id: rand(0..2)},
      {memo: record_memos[rand(0..2)], event_id: rand(3..5)},
    ],
  }
end

daily_records = DailyRecord.all

daily_records.each { |daily_record|
  formatted_attributes = seed_attributes[:record].map { _1.merge({recorded_on: daily_record.recorded_on}) }
  daily_record.records.create(formatted_attributes)
}