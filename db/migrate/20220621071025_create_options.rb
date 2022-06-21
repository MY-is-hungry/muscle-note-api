class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :background_image
      t.references :user

      t.timestamps
    end
  end
end
