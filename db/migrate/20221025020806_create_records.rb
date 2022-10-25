class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.text :memo
      t.integer :volume
      t.date :recorded_on, null: false
      t.references :event
      t.references :daily_record

      t.timestamps
    end
  end
end
