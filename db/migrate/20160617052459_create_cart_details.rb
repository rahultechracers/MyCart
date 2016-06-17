class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|

      t.timestamps
    end
  end
end
