class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :street
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
