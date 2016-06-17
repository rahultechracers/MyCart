class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :date
      t.decimal :total_amount
      t.string :shipping_address
      t.references :user
      t.timestamps
    end
  end
end

