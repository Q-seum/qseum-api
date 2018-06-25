class ChangeAccountInMembership < ActiveRecord::Migration[5.2]
  def change
    change_column :memberships, :account, :string
  end
end
