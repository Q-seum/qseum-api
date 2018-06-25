class Addaccommodations < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accommodations, :string, null: true

  end
end
