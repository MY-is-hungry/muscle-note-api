class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :user_id, null: false, limit: 48

      t.timestamps
    end
  end
end
