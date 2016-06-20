class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories, join_table: 'products_categories'
  has_many :order_details
  validates :name,presence: true
  validates :description, length: {maximum:500, message: "description can not exceed %{count} words"}
  validates :price ,numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\z}i,
      message: 'URL must point to GIT/JPG/PNG pictures'}
end
