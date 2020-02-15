require 'rails_helper'

RSpec.describe 'Index of all Products page', type: :system do
  it 'has a table of products', :js do
    create_list(:product, 4)
    product = create(:product, sku: 'SKU-001', name: 'Kobes')

    visit '/products'

    expect(page).to have_a_products_table
    expect(page).to have_a_new_products_button
    expect(page).to have_products_with(count: 5)
    expect(page).to have_table_header_with(text: 'SKU')
    expect(page).to have_table_header_with(text: 'Name')
    expect(page).to have_table_header_with(text: 'Updated At')
    expect(page).to have_column_for('sku', value: 'SKU-001', record: product)
    expect(page).to have_column_for('name', value: 'Kobes', record: product)
    expect(page).to have_actions_of('Show', path: "/products/#{product.id}", record: product)
    expect(page).to have_actions_of('Edit', path: "/products/#{product.id}/edit", record: product)
    expect(page).to have_actions_of('Delete', path: "/products/#{product.id}", record: product)

    page.find("table tbody tr#product--#{product.id} td#product--#{product.id}_actions .delete").click

    text = page.driver.browser.switch_to.alert.text

    expect(text).to eq('Are you sure you want to delete this product?')
  end

  it 'allows to delete a product', :js do
    product = create(:product, sku: 'SKU-001', name: 'Kobes')

    visit '/products'
    page.find("table tbody tr#product--#{product.id} td#product--#{product.id}_actions .delete").click
    page.driver.browser.switch_to.alert.accept

    expect(page).not_to have_column_for('sku', value: 'SKU-001', record: product)
    expect(page).to have_success_delete_message(product.id)
  end

  private

  def have_a_products_table
    have_css('table#products-table')
  end

  def have_products_with(count:)
    have_css('table tbody tr', count: count)
  end

  def have_table_header_with(text:)
    have_css('table thead tr th', text: text)
  end

  def have_column_for(name, value:, record:)
    have_css("table tbody tr#product--#{record.id} td#product--#{record.id}_#{name}", text: value)
  end

  def have_actions_of(title, path:, record:, **_params)
    within("table tbody tr#product--#{record.id} td#product--#{record.id}_actions") do
      have_link(title, href: path)
    end
  end

  def have_a_new_products_button
    have_link('New Product', href: '/products/new')
  end

  def have_success_delete_message(id)
    have_text("Successfully deleted product #{id}!")
  end
end
