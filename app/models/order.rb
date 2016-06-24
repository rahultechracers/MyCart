class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_details
  validates :date, format: {:with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"}
  validates :total_amount, numericality:true
  validates :shipping_address , format: { with: /\A[a-zA-z0-9]+\z/ ,multiline: true  }
  
  def self.getsum(items)
    sum=0
    items.each do |item|
      product = Product.find_by(id: item.product_id)
      sum+= product.price*item.quantity
    end
    return sum.to_i
  end

end
