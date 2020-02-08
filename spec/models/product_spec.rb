require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    subject(:product) { build(:product) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_uniqueness_of(:sku).case_insensitive }
  end
end
