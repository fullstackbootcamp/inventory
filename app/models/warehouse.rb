class Warehouse < ApplicationRecord
  validates :city, presence: true
  validates :province, presence: true
end
