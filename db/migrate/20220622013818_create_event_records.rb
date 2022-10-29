class CreateEventRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :event_records do |t|
      t.date :first_recorded_on, null: false
      t.text :user_id, null: false
      t.references :event, null: false

      t.timestamps
    end
  end
end
