class OrderDetail < ApplicationRecord
  has_many :cart_orders, dependent: :destroy
  belongs_to :
end
