require 'test_helper'

class IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get ideas_home_url
    assert_response :success
  end

  test "should get history" do
    get ideas_history_url
    assert_response :success
  end

  test "should get category" do
    get ideas_category_url
    assert_response :success
  end

end
