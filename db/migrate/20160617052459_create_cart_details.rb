class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
      t.references :cart
      t.references :product
      t.integer :quantity
      t.timestamps
    end
  end
end
