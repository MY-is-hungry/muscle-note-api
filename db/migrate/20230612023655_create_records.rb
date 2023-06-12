class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :weight
      t.integer :rep
      t.date :executed_on, null: false
      t.references :exercise
      t.references :user, null: false

      t.timestamps
    end
  end
end
