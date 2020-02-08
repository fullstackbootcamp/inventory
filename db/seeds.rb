2.times do
  Product.create!(
    name: Faker::Device.model_name,
    sku: Faker::Device.serial
  )
end

Warehouse.create!([
  {
    street: 'First Rd',
    city: 'Baguio',
    province: 'Benguet'
  },
  {
    street: 'Tabora St.',
    city: 'Binondo',
    province: 'Manila'
  }
])

Stock.create!(
  product: Product.all.sample,
  warehouse: Warehouse.all.sample,
  count: 10
)
