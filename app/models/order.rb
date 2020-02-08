class Order < ApplicationRecord
  belongs_to :warehouse
  has_many :order_items
  has_many :products, through: :order_items

  validates :customer_name, presence: true

  before_validation :assign_uuid

  private

  def assign_uuid
    return unless new_record? || uuid.empty?

    generated_uuid = ''
    presence = true

    while presence == true
      generated_uuid = SecureRandom.uuid

      presence = false unless Order.exists?(uuid: generated_uuid)
    end

    self.uuid = generated_uuid
  end
end
