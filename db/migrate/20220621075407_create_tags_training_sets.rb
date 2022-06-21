class CreateTagsTrainingSets < ActiveRecord::Migration[6.1]
  def change
    create_table :tags_training_sets do |t|
      t.references :tag
      t.references :training_set

      t.timestamps
    end
  end
end
