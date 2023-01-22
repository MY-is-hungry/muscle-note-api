class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.text :user_id
      t.string :color

      t.timestamps
    end
  end
end
