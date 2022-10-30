class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :weight
      t.integer :reps
      t.integer :volume
      t.references :note, null: true
      t.references :event_record

      t.timestamps
    end
  end
end
