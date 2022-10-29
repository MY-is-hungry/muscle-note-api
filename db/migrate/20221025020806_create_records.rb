class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.date :recorded_on, null: false
      t.references :note, null: true
      t.references :event_record, null: false

      t.timestamps
    end
  end
end
