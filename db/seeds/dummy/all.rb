ApplicationRecord.transaction do
  system("rails db:seed:dummy:categories_and_events")
  system("rails db:seed:dummy:event_records")
  system("rails db:seed:dummy:records")
end