require 'date'


def random_date
  num = rand(1..8)
  num.odd? ? Date.today.days_ago(num) : Date.today.days_since(num)
end

def create_daily_record(day_count: 5, id: ENV['DEV_USER_ID'])
  daily_notes = ['最高のコンディションだった', 'まずまずのコンディションだった', 'イマイチなコンディションだった']
  record_notes = ['フォーム意識', 'いつもより重く感じた', '重量意識']
  events = Event.all.sample(3)

  [*1..day_count].map do |i|
    record_date = random_date
    events.each do |event|
      ev_record = EventRecord.find_or_initialize_by(user_id: id, first_recorded_on: record_date, event_id: event.id)
      record = ev_record.records.build(recorded_on: record_date)
      record.build_note(content: record_notes.sample)
      ev_record.save!
    end
    # TODO: 日毎のメモも取れるようにしたい。DB設計要検討。
    # Note.create(content: daily_notes.sample)
  end
end

create_daily_record