class Changevalidtoredeemed < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :redeemed, :boolean, default: false, null: false 

  end
end
