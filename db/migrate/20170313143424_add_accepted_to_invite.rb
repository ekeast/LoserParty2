class AddAcceptedToInvite < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :accepted, :boolean, :default => false
  end
end
