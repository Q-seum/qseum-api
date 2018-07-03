class Removevalid < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :valid
  end
end
