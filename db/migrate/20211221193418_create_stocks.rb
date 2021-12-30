class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :warehouse
      t.string :item_code
      t.string :description
      t.integer :assortment
      t.string :item_group
      t.string :item_unit
      t.decimal :stock
      t.decimal :qty_delivery

      t.timestamps
    end
  end
end
