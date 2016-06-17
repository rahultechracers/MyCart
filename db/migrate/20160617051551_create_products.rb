class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :description
      t.decimal :pricet
      t.string  :image_url
      t.timestamps
    end
  end
end
