class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :height, default: 0
      t.boolean :alive, default: false
      t.integer :water, default: 20
      t.integer :fertilizer, default: 20
      t.integer :sunlight, default: 20

      t.timestamps
    end
  end
end
