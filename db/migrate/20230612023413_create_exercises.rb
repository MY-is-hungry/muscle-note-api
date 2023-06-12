class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 1
      t.references :category, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
