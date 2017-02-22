class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.references :event, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
