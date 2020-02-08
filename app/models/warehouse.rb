class Warehouse < ApplicationRecord
  has_many :stocks
  has_many :products, through: :stocks

  validates :city, presence: true
  validates :province, presence: true
end
