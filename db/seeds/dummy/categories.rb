def seed_attributes
  id = 1
  {
    category: [
      {name: '胸', user_id: id},
      {name: '背中', user_id: id},
      {name: '脚', user_id: id},
      {name: '二頭筋', user_id: id},
      {name: '三頭筋', user_id: id},
      {name: '肩', user_id: id},
    ],
  }
end

Category.create(seed_attributes[:category])