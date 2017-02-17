class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
