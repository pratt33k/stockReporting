class ReportsController < ApplicationController
  def report1
    @stocks = Stock.filter_based_on_stock
  end

  def report2
    @stocks = Stock.unique_filtered_items
    @other_list, @total_list, @warehouses_list, @warehouse_stock_list, @quantity_to_be_delivered = Stock.sum_of_stocks
  end

end
