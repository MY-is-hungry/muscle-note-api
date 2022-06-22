class CreateDailyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_records do |t|
      t.text :note
      t.date :recorded_on, null: false
      t.references :user

      t.timestamps
    end
    add_index :daily_records, :recorded_on, unique: true
  end
end
