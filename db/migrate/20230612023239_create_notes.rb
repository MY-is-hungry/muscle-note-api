class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :content, null: false
      t.bigint :resource_id, null: false
      t.string :resource_kind, null: false
      t.references :user, null: false
      t.timestamps

      t.index [:resource_kind, :resource_id], unique: true, name: :idx_note_unique
    end
  end
end
