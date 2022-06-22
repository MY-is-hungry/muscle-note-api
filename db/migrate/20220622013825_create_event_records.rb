class CreateEventRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :event_records do |t|
      t.text :note
      t.integer :volume
      t.date :recorded_on, null: false
      t.references :event
      t.references :daily_record

      t.timestamps
    end
  end
end
