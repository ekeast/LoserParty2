class AddValueToInvite < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :value, :integer
  end
end
