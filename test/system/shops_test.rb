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
end
