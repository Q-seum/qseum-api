class Usedticketdefault < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :valid, :boolean, default: false, null: false
  end
end
