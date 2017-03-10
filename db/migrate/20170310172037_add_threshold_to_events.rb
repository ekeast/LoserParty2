class AddThresholdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :threshold, :integer
  end
end
