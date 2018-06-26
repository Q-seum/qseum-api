class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :account
      t.date :visit_date
      t.integer :visitors

      t.timestamps
    end
  end
end
