class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|
      t.references  :product, index: true
      t.references  :category, index: true
      t.timestamps
    end
  end
end
