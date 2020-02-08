FactoryBot.define do
  factory :order do
    warehouse { Warehouse.first || association(:warehouse) }
    customer_name { 'MyString' }
    uuid { 'MyString' }
  end
end
