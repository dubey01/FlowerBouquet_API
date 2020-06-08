class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name
      t.string :color
      t.integer :cost

      t.timestamps
    end
  end
end
