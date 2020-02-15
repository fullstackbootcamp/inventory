FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    sku { rand(1000..5000) }
  end
end
