class CreateTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sets do |t|
      t.integer :sets
      t.integer :reps
      t.integer :volume
      t.text :note
      t.references :event_record

      t.timestamps
    end
  end
end
