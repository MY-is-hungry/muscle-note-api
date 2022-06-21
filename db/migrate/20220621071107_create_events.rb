class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :order
      t.integer :general_order
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
