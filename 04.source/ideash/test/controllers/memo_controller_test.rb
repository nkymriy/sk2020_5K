require 'test_helper'

class MemoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get memo_new_url
    assert_response :success
  end

  test "should get show" do
    get memo_show_url
    assert_response :success
  end

  test "should get edit" do
    get memo_edit_url
    assert_response :success
  end

end
