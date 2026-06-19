# frozen_string_literal: true

require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  def setup
    sign_in users(:bob)
  end

  test "visiting the index" do
    visit shops_url
    assert_selector "h1", text: "Shops"
  end

  test "can search for a shop" do
    Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    Shop.create!(name: "ラーメン山田", city: "Osaka", address: "456 Noodle Ave")
    visit shops_url

    fill_in "query", with: "ラーメン二郎"
    click_button "Search"

    assert_text "ラーメン二郎"
    assert_no_text "ラーメン山田"
    assert_no_text "No shops found"
  end

  test "empty search shows all shops" do
    visit shops_path

    fill_in "query", with: ""
    click_button "Search"

    assert_text shops(:shop1).name
    assert_text shops(:shop2).name
  end

  test "shop page shows visits" do
    shop = shops(:shop1)
    visit_record = visits(:visit)

    visit shop_path(shop)

    assert_text visit_record.notes
  end

  test "shops are filtered by city" do
    Visit.delete_all
    Shop.delete_all
    Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    Shop.create!(name: "ラーメン山田", city: "Osaka", address: "456 Noodle Ave")
    visit shops_url

    select "Tokyo", from: "city"
    assert_current_path(/city=Tokyo/)
    assert_text "ラーメン二郎"
    assert_no_text "ラーメン山田"
  end

  test "blank city filter shows all shops" do
    Visit.delete_all
    Shop.delete_all
    Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    Shop.create!(name: "ラーメン山田", city: "Osaka", address: "456 Noodle Ave")
    visit shops_url

    select "All cities", from: "city"
    assert_text "ラーメン二郎"
    assert_text "ラーメン山田"
  end
end
