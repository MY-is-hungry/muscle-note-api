class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :user_id, null: false, limit: 48
      t.integer :weight
      t.integer :rep
      t.references :exercise
      t.date :executed_on, null: false

      t.timestamps
    end
  end
end
