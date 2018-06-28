class Addcolumnstoissuestable < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :user_id, :integer
    add_column :issues, :text, :text
  end
end
