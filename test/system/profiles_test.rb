require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "should create profile" do
    visit profiles_url
    click_on "New profile"

    fill_in "About", with: @profile.about
    fill_in "Cover photo data", with: @profile.cover_photo_data
    fill_in "Display name", with: @profile.display_name
    check "Is creator" if @profile.is_creator
    fill_in "User", with: @profile.user_id
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "should update Profile" do
    visit profile_url(@profile)
    click_on "Edit this profile", match: :first

    fill_in "About", with: @profile.about
    fill_in "Cover photo data", with: @profile.cover_photo_data
    fill_in "Display name", with: @profile.display_name
    check "Is creator" if @profile.is_creator
    fill_in "User", with: @profile.user_id
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Profile" do
    visit profile_url(@profile)
    accept_confirm { click_on "Destroy this profile", match: :first }

    assert_text "Profile was successfully destroyed"
  end
end
