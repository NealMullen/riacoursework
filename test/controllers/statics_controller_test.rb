require 'test_helper'

class StaticsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

end
