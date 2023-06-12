class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :uid, limit: 48, null: false
      t.integer :authentication_type, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
