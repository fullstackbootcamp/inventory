FactoryBot.define do
  factory :stock do
    count { 1 }
    product { nil }
    warehouse { nil }
  end
end
