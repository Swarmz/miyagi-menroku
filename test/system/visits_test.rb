# frozen_string_literal: true

require "application_system_test_case"

class VisitsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:bob)
  end

  test "should create visit" do
    menya = Shop.create!(name: "menya", city: "Sendai", address: "1-2-3 Aoba-ku", website: nil)
    visit shops_url
    click_on "Create New Visit"

    select "menya", from: "Shop"
    fill_in "Menu item", with: "Ramen"
    fill_in "Rating", with: "5"
    fill_in "Visited on", with: "2026-06-03"
    click_on "Create Visit"

    assert_text "Visit was successfully created."
    assert_text "Visits"
  end

  test "should update visit" do
    visit = visits(:visit)
    new_shop = shops(:shop2)
    visit visit_url(visit)
    click_on "Edit Visit"

    select new_shop.name, from: "Shop"
    fill_in "Menu item", with: "Ramen"
    fill_in "Rating", with: "5"
    fill_in "Visited on", with: "2026-06-03"
    fill_in "Notes", with: "Updated notes"
    click_on "Update Visit"

    assert_text "Visit was successfully updated."
    assert_text new_shop.name
    visit.reload
    assert_equal new_shop, visit.shop
  end

  test "should destroy visit" do
    visit = visits(:visit)

    visit visit_url(visit)

    accept_confirm do
      click_on "Delete Visit", match: :first
    end


    assert_text "Visit was successfully deleted."
  end
end
