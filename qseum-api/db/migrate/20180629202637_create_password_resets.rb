class CreatePasswordResets < ActiveRecord::Migration[5.2]
  def change
    create_table :password_resets do |t|
      t.integer :user_id
      t.string :email
      t.string :new_token
      t.boolean :used, default: false, null: false

      t.timestamps
    end
  end
end
