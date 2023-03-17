id = ENV['DEV_USER_ID']

category_attrs = [
  {
    name: '胸', user_id: id,
    exercise_attrs: [
      {name: 'ギロチンベンチプレス', user_id: id},
      {name: 'ベンチプレス', user_id: id},
      {name: 'ダンベルプレス', user_id: id},
    ],
  },
  {
    name: '背中', user_id: id,
    exercise_attrs: [
      {name: 'デッドリフト', user_id: id},
      {name: '懸垂', user_id: id},
    ],
  },
  {
    name: '脚', user_id: id,
    exercise_attrs: [
      {name: 'スクワット', user_id: id},
      {name: 'レッグエクステンション', user_id: id},
    ],
  },
  {
    name: '二頭筋', user_id: id,
    exercise_attrs: [
      {name: 'バーベルカール', user_id: id},
    ],
  },
  {
    name: '三頭筋', user_id: id,
    exercise_attrs: [
      {name: 'プッシュダウン', user_id: id},
      {name: 'ナローベンチプレス', user_id: id},
    ],
  },
  {
    name: '肩', user_id: id,
    exercise_attrs: [
      {name: 'サイドレイズ', user_id: id},
      {name: 'オーバーヘッドプレス', user_id: id},
    ],
  },
  {
    name: 'その他', user_id: id,
    exercise_attrs: [
      {name: 'デスティーノ', user_id: id},
      {name: 'レインメーカー', user_id: id},
      {name: 'フェニックススプラッシュ', user_id: id},
      {name: '片翼の天使', user_id: id},
      {name: 'カナディアンデストロイヤー', user_id: id},
      {name: '昇天・改', user_id: id},
      {name: 'スターダストプレス', user_id: id},
    ],
  },
]

category_attrs.each do |cate_attr|
  exercise_attrs = cate_attr.delete(:exercise_attrs)
  category = Category.find_or_initialize_by(cate_attr)
  category.exercises.build(exercise_attrs)
  category.save!
end