class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :account
      t.string :username
      t.string :password_digest
      t.string :api_token
      t.string :email
      t.boolean :is_admin, default: false, null: false

      t.timestamps
    end
  end
end
