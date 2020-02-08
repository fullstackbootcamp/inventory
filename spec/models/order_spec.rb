require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    subject(:order) { build(:order) }

    it { is_expected.to validate_presence_of(:customer_name) }
    it { is_expected.to validate_presence_of(:uuid) }
  end

  describe 'associations' do
    subject(:order) { create(:order) }

    it { is_expected.to belong_to(:warehouse) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:products) }
  end
end
