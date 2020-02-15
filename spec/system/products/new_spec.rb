require 'rails_helper'

RSpec.describe 'Create a product page', type: :system do
  it 'allows me to create a new product' do
    visit '/products/new'

    within('#product-form') do
      fill_in_product_field('name', with: 'Huawei')
      fill_in_product_field('sku', with: 'HUA-001')
      submit_form
    end

    product = Product.find_by(name: 'Huawei', sku: 'HUA-001')

    expect(page).to have_attribute_of('name', value: 'Huawei', record: product)
    expect(page).to have_attribute_of('sku', value: 'HUA-001', record: product)
    expect(page).to have_a_success_message
  end

  private

  def fill_in_product_field(name, with:)
    page.find("#product_#{name}").fill_in(with: with)
  end

  def submit_form
    page.find('#submit-button').click
  end

  def have_attribute_of(name, value:, record:)
    have_css("#product--#{record.id}_#{name}", text: value)
  end

  def have_a_success_message
    have_text('Successfully created a product!')
  end
end
