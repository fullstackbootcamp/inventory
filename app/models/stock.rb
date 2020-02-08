class Stock < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  validates :count, presence: true, numericality: { greater_than: 0 }
end
