id = ENV['DEV_USER_ID']

weight_list = [40, 50, 60, 70, 80, 90, 100]
rep_list = [5, 8, 10, 12, 15, 20]
# TODO: Note関連付け追加
note_list = [
  'フォーム崩れあり', 'チートあり', '余裕あり', '狂人による妨害', '美女が現れ奮起',
  'マシン待ちの人の視線が気になりインターバルが少ない',
  'なぜ髪のセットが上手な男性美容師は存在しないのか、はたまた自分のセンスが悪いのか、その他の可能性があるのか、と思考が巡りフォーム崩れ',
  '自室の小窓に適したサイズのカーテンが見つからず気分が落ち込み気味',
]

timezone_from = Time.zone.parse('2023-01-01 00:00:00')
timezone_to   = Time.zone.parse('2023-12-31 00:00:00')

exercises = Exercise.all
100.times do |i|
  args = { weight: weight_list.sample, rep: rep_list.sample, executed_on: rand(timezone_from..timezone_to), exercise_id: exercises.sample.id }
  rand(1..5).times { Record.create!(user_id: id, **args) }
end