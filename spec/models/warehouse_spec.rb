require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'validations' do
    subject(:warehouse) { build(:warehouse) }

    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:province) }
  end

  describe 'associations' do
    subject(:warehouse) { create(:warehouse) }

    it { is_expected.to have_many(:stocks) }
    it { is_expected.to have_many(:products) }
  end
end
