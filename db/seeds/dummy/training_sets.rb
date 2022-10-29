def set_constant
  weights = [40, 50, 60, 70, 80, 90, 100]
  reps = [5, 8, 10, 12, 15, 20]
  set_notes = ['フォーム崩れあり', 'チートあり', '余裕あり']
  return weights, reps, set_notes
end

def add_sets_to_record(set_count: 3)
  weights, reps, set_notes = set_constant
  records = Record.all

  records.each { |record|
    set_attrs = [*1..set_count].map {
      weight, rep = weights.sample, reps.sample
      { weight: weight, reps: rep, volume: weight * rep}
    }
    sets = record.training_sets.build(set_attrs)
    sets.each { _1.build_note(content: set_notes.sample) }
    record.save!
  }
end

add_sets_to_record
