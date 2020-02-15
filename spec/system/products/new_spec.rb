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

  it 'shows form errors' do
    create(:product, sku: 'PROD-001')

    visit '/products/new'
    submit_form

    expect(page).to show_error_for('name', message: "can't be blank")
    expect(page).to show_error_for('sku', message: "can't be blank")

    within('#product-form') do
      fill_in_product_field('sku', with: 'PROD-001')
      submit_form
    end

    expect(page).to show_error_for('sku', message: 'has already been taken')
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

  def show_error_for(name, message:)
    have_css("#product_#{name}_errors .error", text: message)
  end
end
