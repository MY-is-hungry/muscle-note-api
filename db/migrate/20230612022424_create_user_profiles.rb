class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :email #匿名認証ではnil
      t.string :display_name
      t.string :phone_number #匿名認証ではnil
      t.references :user, null: false

      t.timestamps
    end
  end
end
