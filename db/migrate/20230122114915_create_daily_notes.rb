class CreateDailyNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_notes do |t|
      t.text :content, null: false
      t.string :user_id, null: false, limit: 48
      t.date :recorded_on, null: false
      t.timestamps

      t.index [:user_id, :recorded_on], unique: true, name: :idx_daily_note_unique
    end
  end
end
