require "test_helper"

class Admin::UserRolesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_user_roles_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_user_roles_update_url
    assert_response :success
  end
end
