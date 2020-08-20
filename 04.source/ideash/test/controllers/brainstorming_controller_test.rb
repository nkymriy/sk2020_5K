require 'test_helper'

class BrainstormingControllerTest < ActionDispatch::IntegrationTest
  test "should get replay" do
    get brainstorming_replay_url
    assert_response :success
  end

  test "should get edit" do
    get brainstorming_edit_url
    assert_response :success
  end

  test "should get new" do
    get brainstorming_new_url
    assert_response :success
  end

end
