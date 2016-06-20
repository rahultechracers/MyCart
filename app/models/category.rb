class Category < ActiveRecord::Base
  has_and_belongs_to_many :products ,join_table: 'products_categories'
  validates :name , presence: true, format:{ with: /\A[a-zA-Z]+\z/}
end
