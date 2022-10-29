class CreateTrainingSetTags < ActiveRecord::Migration[6.1]
  def change
    create_table :training_set_tags do |t|
      t.references :training_set_id
      t.references :tag_id

      t.timestamps
    end
  end
end
