class CreateTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :training_sets do |t|
      t.integer :weight
      t.integer :reps
      t.integer :volume
      t.references :note, null: true
      t.references :record

      t.timestamps
    end
  end
end
