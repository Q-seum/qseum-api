class AddTicketTypeColumnsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :general, :integer
    add_column :tickets, :senior, :integer
    add_column :tickets, :military, :integer
    add_column :tickets, :child, :integer
    remove_column :tickets, :tickets
  end
end
