class OrderDetail < ApplicationRecord
  enum making_status: { production_cannot: 0, awaiting_manufacture: 1, under_manufacture:2, complete:3 }
  has_many :cart_orders, dependent: :destroy
  belongs_to :order
  belongs_to :item

def with_tax_price
    (price * 1.1).floor
end

end
