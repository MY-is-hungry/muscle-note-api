class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :color_name, null: false
      t.references :user

      t.timestamps
    end
  end
end
