require 'date'


def random_datetime
  num = rand(1..12)
  num.odd? ? Time.current.days_ago(num) : Time.current.days_since(num)
end

def create_daily_record(day_count: 5, id: ENV['DEV_USER_ID'])
  # daily_notes = ['最高のコンディションだった', 'まずまずのコンディションだった', 'イマイチなコンディションだった']
  record_notes = ['フォーム意識', 'いつもより重く感じた', '重量意識']
  events = Event.all.sample(3)

  [*1..day_count].map do |i|
    record_time = random_datetime
    events.each do |event|
      ev_record = EventRecord.find_or_initialize_by(user_id: id, recorded_at: record_time, event_id: event.id)
      # record = ev_record.records.build(recorded_at: record_time)
      # record.build_note(content: record_notes.sample)
      ev_record.save!
      record_time += 1.minute
    end
    # TODO: 日毎のメモも取れるようにしたい。DB設計要検討。
    # Note.create(content: daily_notes.sample)
  end
end

create_daily_record(day_count: 12)