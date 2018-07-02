class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :tickets
      t.boolean :used
      t.string :recip_email
      t.string :buyer_email

      t.timestamps
    end
  end
end
