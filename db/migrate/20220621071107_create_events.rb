class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :order
      t.integer :general_order
      t.text :user_id, null: false
      t.references :category

      t.timestamps
    end
  end
end
