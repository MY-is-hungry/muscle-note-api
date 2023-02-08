class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :user_id, null: false, limit: 48
      t.string :color

      t.timestamps
    end
  end
end
