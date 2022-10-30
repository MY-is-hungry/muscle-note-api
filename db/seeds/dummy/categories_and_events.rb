id = ENV['DEV_USER_ID']

category_attrs = [
  {name: '胸', user_id: id},
  {name: '背中', user_id: id},
  {name: '脚', user_id: id},
  {name: '二頭筋', user_id: id},
  {name: '三頭筋', user_id: id},
  {name: '肩', user_id: id},
]

event_attrs = [
  [
    {name: 'ベンチプレス', user_id: id},
    {name: 'ダンベルベンチプレス', user_id: id},
  ],
  [
    {name: 'デッドリフト', user_id: id},
    {name: '懸垂', user_id: id},
  ],
  [
    {name: 'スクワット', user_id: id},
    {name: 'レッグエクステンション', user_id: id},
  ],
  [
    {name: 'バーベルカール', user_id: id},
  ],
  [
    {name: 'プッシュダウン', user_id: id},
    {name: 'ナローベンチプレス', user_id: id},
  ],
  [
    {name: 'サイドレイズ', user_id: id},
    {name: 'オーバーヘッドプレス', user_id: id},
  ],
]

category_attrs.each_with_index do |cate_attr, i|
  category = Category.find_or_initialize_by(cate_attr)
  category.events.build(event_attrs[i])
  category.save!
end