require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "user can sign up" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign up"

    assert_text "Welcome"
  end

  test "user can sign in" do
    User.create!(email: "test@example.com", password: "password123")
    visit new_user_session_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"

    click_button "Log in"

    assert_text "Signed in successfully"
  end

  # ---> Disabled until root route is created <---
  # test "user can sign out" do
  #   User.create!(email: "test@example.com", password: "password123")
  #   visit new_user_session_path

  #   fill_in "Email", with: "test@example.com"
  #   fill_in "Password", with: "password123"

  #   click_button "Log in"
  #   assert_text "Signed in successfully"

  #   click_button "Sign out"

  #   assert_text "Signed out successfully"
  # end
end
