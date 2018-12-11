class RemoveAliveFromPlant < ActiveRecord::Migration[5.2]
  def change
    remove_column :plants, :alive
  end
end
