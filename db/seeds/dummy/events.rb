def seed_attributes
  id = 1
  {
    event: [
      {name: 'ベンチプレス', category_id: 1, user_id: id},
      {name: 'デッドリフト', category_id: 2, user_id: id},
      {name: 'スクワット', category_id: 3, user_id: id},
      {name: 'バーベルカール', category_id: 4, user_id: id},
      {name: 'プッシュダウン', category_id: 5, user_id: id},
      {name: 'サイドレイズ', category_id: 6, user_id: id},
    ]
  }
end

Event.create(seed_attributes[:event])
