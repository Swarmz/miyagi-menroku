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
end
