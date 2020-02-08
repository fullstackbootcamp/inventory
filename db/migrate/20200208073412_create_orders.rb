class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :warehouse, foreign_key: true
      t.string :customer_name
      t.string :uuid

      t.timestamps
    end
  end
end
