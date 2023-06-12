
category_attrs = [
  {
    name: '胸',
    exercise_attrs: [
      {name: 'ギロチンベンチプレス'},
      {name: 'ベンチプレス'},
      {name: 'ダンベルプレス'},
    ],
  },
  {
    name: '背中',
    exercise_attrs: [
      {name: 'デッドリフト'},
      {name: '懸垂'},
    ],
  },
  {
    name: '脚',
    exercise_attrs: [
      {name: 'スクワット'},
      {name: 'レッグエクステンション'},
    ],
  },
  {
    name: '二頭筋',
    exercise_attrs: [
      {name: 'バーベルカール'},
    ],
  },
  {
    name: '三頭筋',
    exercise_attrs: [
      {name: 'プッシュダウン'},
      {name: 'ナローベンチプレス'},
    ],
  },
  {
    name: '肩',
    exercise_attrs: [
      {name: 'サイドレイズ'},
      {name: 'オーバーヘッドプレス'},
    ],
  },
  {
    name: 'その他',
    exercise_attrs: [
      {name: 'ハイフライフロー'},
      {name: 'スターダストプレス'},
      {name: 'デスティーノ'},
      {name: 'レインメーカー'},
      {name: 'フェニックススプラッシュ'},
      {name: '片翼の天使'},
      {name: 'カナディアンデストロイヤー'},
      {name: '昇天・改'},
    ],
  },
  {
    name: 'テスト用カテゴリテストテストテストテストテスト',
    exercise_attrs: [
      {name: 'そこそこ長くしてみるよ！そこそこ長くしてみるよ！そこそこ長くしてみるよ！（42文字）'},
      {name: 'めちゃめちゃめちゃめちゃ長くしてみるよ！めちゃめちゃめちゃめちゃ長くしてみるよ！めちゃめちゃめちゃめちゃ長くしてみるよ！めちゃめちゃめちゃめちゃ長くしてみるよ！（86文字）'},
      {name: 'み'},
      {name: 'じか'},
      {name: 'くして'},
    ],
  }
]

user = User.find_by(uid: ENV['DEV_USER_ID'])
category_attrs.each do |c_attr|
  exercise_attrs = c_attr.delete(:exercise_attrs)
  category = user.categories.find_or_initialize_by(c_attr)
  exercise_attrs.each do |e_attr|
    category.exercises.build(e_attr.merge(user_id: user.id))
  end
  category.save!
rescue => e
  p e
end