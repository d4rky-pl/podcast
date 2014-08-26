require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get podcast" do
    get :podcast
    assert_response :success
  end

  test "should get stream" do
    get :stream
    assert_response :success
  end

end
