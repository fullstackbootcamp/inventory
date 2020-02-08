class Product < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true, uniqueness: { case_sensitive: false }
end
