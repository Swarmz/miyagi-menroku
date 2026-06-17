# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    sign_in users(:bob)
  end
  test "visiting the user profile" do
    visit profile_path
    assert_text users(:bob).email
    assert_text "Recent Visits"
  end

  test "user profile shows recent visits" do
    visit profile_path
    assert_text "Recent Visits"
  end

  test "recent visits links to shop show page" do
    visit_record = visits(:visit)
    visit profile_path
    click_link visit_record.shop.name
    assert_current_path shop_path(visit_record.shop)
  end
end
