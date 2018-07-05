class AddDefaultFalseToValidSelfie < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :valid_selfie,:boolean, default: false, null: false
  end
end
