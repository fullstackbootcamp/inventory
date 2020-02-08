FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    sku { Faker::Device.serial }
  end
end
