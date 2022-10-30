class CreateEventRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :event_records do |t|
      t.datetime :recorded_at, null: false
      t.string :user_id, null: false
      t.references :event

      t.timestamps
    end
  end
end
