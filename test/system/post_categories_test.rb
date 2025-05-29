require "application_system_test_case"

class PostCategoriesTest < ApplicationSystemTestCase
  setup do
    @post_category = post_categories(:one)
  end

  test "visiting the index" do
    visit post_categories_url
    assert_selector "h1", text: "Post categories"
  end

  test "should create post category" do
    visit post_categories_url
    click_on "New post category"

    fill_in "Category", with: @post_category.category_id
    fill_in "Post", with: @post_category.post_id
    click_on "Create Post category"

    assert_text "Post category was successfully created"
    click_on "Back"
  end

  test "should update Post category" do
    visit post_category_url(@post_category)
    click_on "Edit this post category", match: :first

    fill_in "Category", with: @post_category.category_id
    fill_in "Post", with: @post_category.post_id
    click_on "Update Post category"

    assert_text "Post category was successfully updated"
    click_on "Back"
  end

  test "should destroy Post category" do
    visit post_category_url(@post_category)
    accept_confirm { click_on "Destroy this post category", match: :first }

    assert_text "Post category was successfully destroyed"
  end
end
