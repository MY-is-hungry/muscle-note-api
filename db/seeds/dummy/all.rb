ApplicationRecord.transaction do
  system("rails db:seed:dummy:categories")
  system("rails db:seed:dummy:events")
  system("rails db:seed:dummy:daily_records")
  system("rails db:seed:dummy:records")
  system("rails db:seed:dummy:training_sets")
end