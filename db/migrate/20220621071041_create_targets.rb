class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.integer :monthly_target_volume
      t.integer :monthly_target_days
      t.text :user_id, null: false

      t.timestamps
    end
  end
end
