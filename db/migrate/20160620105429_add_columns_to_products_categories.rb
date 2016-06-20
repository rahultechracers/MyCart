class AddColumnsToProductsCategories < ActiveRecord::Migration
  def change
    add_reference :product_categories, :product 
    add_reference :product_categories, :category
  end
end
