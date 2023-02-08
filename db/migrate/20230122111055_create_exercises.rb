class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.references :category
      t.string :user_id, null: false, limit: 48

      t.timestamps
    end
  end
end
