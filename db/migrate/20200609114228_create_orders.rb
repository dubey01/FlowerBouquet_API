class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :order_amount
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
