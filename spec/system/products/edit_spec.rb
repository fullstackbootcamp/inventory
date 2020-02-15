require 'rails_helper'

RSpec.describe 'Edit product page', type: :system do
  it 'allows to edit a product' do
    product = create(:product, name: 'Haier', sku: 'HTV-32-LED')

    visit "/products/#{product.id}/edit"

    # Expect values of the record to reflect on the input
    expect(page).to have_value_of('Haier', attr: 'name')
    expect(page).to have_value_of('HTV-32-LED', attr: 'sku')

    # Change values of the form
    fill_in_product_field('name', with: 'Sony')
    fill_in_product_field('sku', with: 'SNY-65-LED')
    submit_form

    # Expect that the record will change values
    expect(page).to have_attribute_of('name', value: 'Sony', record: product)
    expect(page).to have_attribute_of('sku', value: 'SNY-65-LED', record: product)
    expect(page).to have_a_success_message
  end

  private

  def have_value_of(value, attr:)
    have_field("product_#{attr}", with: value)
  end

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
    have_text('Successfully updated the product!')
  end
end
