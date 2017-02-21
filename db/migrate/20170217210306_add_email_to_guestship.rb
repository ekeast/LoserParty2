class AddEmailToGuestship < ActiveRecord::Migration[5.0]
  def change
    add_column :guestships, :email, :string
  end
end
