class Product < ApplicationRecord
  has_many :stocks
  has_many :warehouses, through: :stocks

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: { case_sensitive: false }
end
