class Addimagecolumnstouserstable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :selfie, :string
    add_column :users, :valid_selfie, :boolean
  end
end
