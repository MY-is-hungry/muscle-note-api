def seed_attributes
  set_memos = ['フォーム崩れあり', 'チートあり', '余裕あり']

  {
    set: [
      {memo: set_memos.sample, weight: 50, reps: 12},
      {memo: set_memos.sample, weight: 60, reps: 12},
      {memo: set_memos.sample, weight: 70, reps: 12},
    ],
  }
end

records = Record.all

records.each { |record|
  formatted_attributes = seed_attributes[:set].map { _1.merge({volume: _1[:weight] * _1[:reps]}) }
  sets = record.training_sets.create(formatted_attributes)
  record.update(volume: sets.sum {_1.volume})
}
