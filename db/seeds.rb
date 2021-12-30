# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'csv'
CSV.foreach(Rails.root.join('db/stockc.csv'), headers: true) do |t|
  Stock.create( {
                  warehouse: t["warehouse"],
                  item_code: t["ItemCode"],
                  description: t["Description"],
                  assortment: t["Assortment"],
                  item_group: t["ItemGroup"],
                  item_unit: t["ItemUnit"],
                  stock: t["Stock"],
                  qty_delivery: t["QtyToBeDelivered"],
                 } )
end
