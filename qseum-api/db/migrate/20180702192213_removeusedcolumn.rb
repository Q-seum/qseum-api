class Removeusedcolumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :used
  end
end
