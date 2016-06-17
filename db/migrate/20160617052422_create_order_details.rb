class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.decimal :price
      t.timestamps
    end
  end
end
