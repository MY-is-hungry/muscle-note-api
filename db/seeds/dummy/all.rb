ApplicationRecord.transaction do
  system("rails db:seed:dummy:users")
  system("rails db:seed:dummy:categories_and_execises")
  system("rails db:seed:dummy:records")
end