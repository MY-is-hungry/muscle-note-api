class CreateDailyNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_notes do |t|
      t.text :content, null: false
      t.text :user_id, null: false

      t.timestamps
    end
  end
end
