class Changevaliddefault < ActiveRecord::Migration[5.2]
  def change
    change_column :tickets, :valid, :boolean, default: true, null: false 
  end
end
