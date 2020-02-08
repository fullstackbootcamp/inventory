class Order < ApplicationRecord
  belongs_to :warehouse

  validates :customer_name, presence: true
  validates :uuid, presence: true
end
