# frozen_string_literal: true

require "application_system_test_case"

class NavigationTest < ApplicationSystemTestCase
  def setup
    sign_in users(:bob)
  end

  test "can see the navigation bar" do
    visit root_path
    within "nav" do
      assert_link "Home"
      assert_link "Profile"
      assert_button "Sign out"
    end
  end

  test "can navigate to profile page" do
    visit root_path
    click_link "Profile"
    assert_current_path profile_path
  end

  test "can navigate to home page" do
    visit profile_path
    click_link "Home"
    assert_current_path root_path
  end

  test "can sign out" do
    visit root_path
    click_button "Sign out"
    assert_current_path new_user_session_path
    assert_text "Signed out successfully."
  end
end
