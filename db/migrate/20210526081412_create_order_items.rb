class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.timestamps
    end
  end
end
