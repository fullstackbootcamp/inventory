require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    subject(:product) { build(:product) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_uniqueness_of(:sku).case_insensitive }
  end

  describe 'associations' do
    subject(:product) { create(:product) }

    it { is_expected.to have_many(:stocks) }
    it { is_expected.to have_many(:warehouses) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:orders) }
  end
end
