class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.decimal :volume
      t.text :note
      t.date :recorded_on, null: false
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
