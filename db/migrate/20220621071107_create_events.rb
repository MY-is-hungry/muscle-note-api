class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :order
      t.integer :general_order
      t.string :user_id, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
