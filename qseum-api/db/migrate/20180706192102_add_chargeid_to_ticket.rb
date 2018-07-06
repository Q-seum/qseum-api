class AddChargeidToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :charge_id, :string
  end
end
