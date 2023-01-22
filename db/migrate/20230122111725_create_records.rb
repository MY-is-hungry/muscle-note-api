class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.text :user_id, null: false
      t.integer :weight
      t.integer :rep
      t.references :exercise
      t.datetime :start_at

      t.timestamps
    end
  end
end
