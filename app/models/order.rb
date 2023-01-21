class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { awaiting_payment: 0, payment_confirmation: 1, under_manufacture: 2, preparing_to_ship: 3, already_shipped: 4}
  belongs_to :customer
  has_many :order_details

def with_tax_price
    (price * 1.1).floor
end
end
