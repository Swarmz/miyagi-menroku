require "test_helper"

class ShopTest < ActiveSupport::TestCase
  test "search returns matching shop" do
    shop = Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    results = Shop.search("ラーメン二郎")

    assert_includes results, shop
  end

  test "search returns partial match" do
    shop = Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    results = Shop.search("二郎")

    assert_includes results, shop
  end

  test "empty search returns all Shop" do
    shop1 = Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    shop2 = Shop.create!(name: "ラーメン山田", city: "Osaka", address: "456 Noodle Ave")
    results = Shop.search("")

    assert_includes results, shop1
    assert_includes results, shop2
  end

  test "search returns no matches" do
    Shop.create!(name: "ラーメン二郎", city: "Tokyo", address: "123 Ramen St")
    results = Shop.search("ラーメン不存在")

    assert_empty results
  end
end
