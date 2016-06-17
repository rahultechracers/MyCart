class CreateTransactionDetails < ActiveRecord::Migration
  def change
    create_table :transaction_details do |t|
      t.references :order
      t.references :user
      t.boolean :payment_status
      t.decimal :order_amount
      t.timestamps
    end
  end
end
