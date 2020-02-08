FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    order { Order.first || association(:order) }
    product { Product.first || association(:product) }
  end
end
