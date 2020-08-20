require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get users_signin_url
    assert_response :success
  end

  test "should get signup" do
    get users_signup_url
    assert_response :success
  end

  test "should get singout" do
    get users_singout_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

end
