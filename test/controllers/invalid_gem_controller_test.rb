require 'test_helper'

class InvalidGemControllerTest < ActionController::TestCase
  test "should get by_lockfile" do
    get :by_lockfile
    assert_response :success
  end

  test "should get by_list" do
    get :by_list
    assert_response :success
  end

end
