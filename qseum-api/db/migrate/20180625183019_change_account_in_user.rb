class ChangeAccountInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :account, :string
  end
end
