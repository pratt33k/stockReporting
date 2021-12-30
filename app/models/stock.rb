
class Stock < ApplicationRecord

  def self.unique_filtered_items

    @stock46 = (Stock.where("item_code LIKE ?", "4" + "%").or(Stock.where("item_code LIKE ?", "6" + "%")))
                .and(Stock.where("stock != ?", 0).or(Stock.where("qty_delivery != ?", 0)))
                .group(:item_code)

  end

  def self.sum_of_stocks

    total_stock_list = []
    others_stock_list = []
    warehouses_list = []
    warehouse_stock_list = []
    delivered_qty_list = []

    # I want to calculate the total stock of a single item = stock of the item where warehouse is 1,PROD,19,20,Others except 2
    # Others is sum of all instances except Total & 2
    # To calculate the total of each unique item, I need to store an array

    stock46_all_entries = Stock.where("item_code LIKE ?", "4" + "%").or(Stock.where("item_code LIKE ?", "6" + "%"))

    unique_filtered_items.each do |unq_item_entry|
      others_sum = 0.0
      total_sum = 0.0
      warehouses = []
      warehouse_stock = []
      qty_to_be_delivered = 0.0

      stock46_all_entries.each do |item_entry|

        if unq_item_entry.item_code == item_entry.item_code

          if item_entry.warehouse != "1" && item_entry.warehouse != "PROD" && item_entry.warehouse != "19" && item_entry.warehouse != "20" && item_entry.warehouse != "2"
            others_sum += item_entry.stock
          end

          if item_entry.warehouse != "2"
            total_sum += item_entry.stock
          end

          if item_entry.stock != 0
            if item_entry.warehouse == "1"
              warehouses.push("1")
              warehouse_stock.push(item_entry.stock)
            elsif item_entry.warehouse == "PROD"
              warehouses.push("PROD")
              warehouse_stock.push(item_entry.stock)
            elsif item_entry.warehouse == "19"
              warehouses.push("19")
              warehouse_stock.push(item_entry.stock)
            elsif item_entry.warehouse == "20"
              warehouses.push("20")
              warehouse_stock.push(item_entry.stock)
            elsif item_entry.warehouse == "2"
              warehouses.push("2")
              warehouse_stock.push(item_entry.stock)
            end
          end

          qty_to_be_delivered += item_entry.qty_delivery
        end
      end
      others_stock_list.push(others_sum)
      total_stock_list.push(total_sum)
      warehouses_list.push(warehouses)
      warehouse_stock_list.push(warehouse_stock)
      delivered_qty_list.push(qty_to_be_delivered)
    end

    return others_stock_list, total_stock_list, warehouses_list, warehouse_stock_list, delivered_qty_list
  end

  def self.filter_based_on_stock
    @nonempty_stock = Stock.where("stock > ?", 0.9)
  end

end
