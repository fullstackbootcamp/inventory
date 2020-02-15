require 'rails_helper'

RSpec.describe 'Shows the product page', type: :system do
  it 'shows all product information' do
    product = create(:product, name: 'Casio Watch', sku: 'CAS-012')

    visit "/products/#{product.id}"

    expect(page).to have_attribute_of('name', value: 'Casio Watch', para_sa: product)
    expect(page).to have_attribute_of('sku', value: 'CAS-012', para_sa: product)
  end

  private

  def have_attribute_of(name, value:, para_sa:)
    have_css("#product--#{para_sa.id}_#{name}", text: value)
  end
end
