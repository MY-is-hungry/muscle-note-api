def set_constant
  weights = [40, 50, 60, 70, 80, 90, 100]
  reps = [5, 8, 10, 12, 15, 20]
  record_notes = ['フォーム崩れあり', 'チートあり', '余裕あり']
  return weights, reps, record_notes
end

def add_sets_to_event_record
  weights, reps, record_notes = set_constant
  ev_records = EventRecord.all

  ev_records.each { |ev_record|
    set_attrs = [*1..rand(3..5)].map {
      weight, rep = weights.sample, reps.sample
      { weight: weight, reps: rep, volume: weight * rep}
    }
    records = ev_record.records.build(set_attrs)
    records.each { _1.build_note(content: record_notes.sample) }
    ev_record.save!
  }
end

add_sets_to_event_record
