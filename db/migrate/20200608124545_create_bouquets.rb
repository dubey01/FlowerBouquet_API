class CreateBouquets < ActiveRecord::Migration[5.2]
  def change
    create_table :bouquets do |t|
      t.string :name
      t.string :size
      t.integer :cost

      t.timestamps
    end
  end
end
