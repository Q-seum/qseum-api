class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.integer :account
      t.string :primary_name
      t.string :secondary_name
      t.string :address
      t.string :phone
      t.string :email
      t.integer :membership_type
      t.date :join_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
