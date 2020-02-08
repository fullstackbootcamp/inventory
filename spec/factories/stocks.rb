FactoryBot.define do
  factory :stock do
    count { 1 }
    product { Product.first || association(:product) }
    warehouse { Warehouse.first || association(:warehouse) }
  end
end
