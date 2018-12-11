class AddTurnCountToPlant < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :turn_count, :integer, default: 0
  end
end
