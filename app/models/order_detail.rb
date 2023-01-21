class OrderDetail < ApplicationRecord
  has_many :cart_orders, dependent: :destroy
  belongs_to :order
  belongs_to :item

def with_tax_price
    (price * 1.1).floor
end

end
