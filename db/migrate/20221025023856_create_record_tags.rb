class CreateRecordTags < ActiveRecord::Migration[6.1]
  def change
    create_table :record_tags do |t|
      t.references :record
      t.references :tag

      t.timestamps
    end
  end
end
