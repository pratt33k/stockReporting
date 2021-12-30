require "application_system_test_case"

class StocksTest < ApplicationSystemTestCase
  setup do
    @stock = stocks(:one)
  end

  test "visiting the index" do
    visit stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "creating a Stock" do
    visit stocks_url
    click_on "New Stock"

    fill_in "Assortment", with: @stock.assortment
    fill_in "Description", with: @stock.description
    fill_in "Item code", with: @stock.item_code
    fill_in "Item group", with: @stock.item_group
    fill_in "Item unit", with: @stock.item_unit
    fill_in "Qty delivery", with: @stock.qty_delivery
    fill_in "Stock", with: @stock.stock
    fill_in "Warehouse", with: @stock.warehouse
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "updating a Stock" do
    visit stocks_url
    click_on "Edit", match: :first

    fill_in "Assortment", with: @stock.assortment
    fill_in "Description", with: @stock.description
    fill_in "Item code", with: @stock.item_code
    fill_in "Item group", with: @stock.item_group
    fill_in "Item unit", with: @stock.item_unit
    fill_in "Qty delivery", with: @stock.qty_delivery
    fill_in "Stock", with: @stock.stock
    fill_in "Warehouse", with: @stock.warehouse
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock" do
    visit stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock was successfully destroyed"
  end
end
