require 'test_helper'

class PosttypesControllerTest < ActionController::TestCase
  setup do
    @posttype = posttypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posttypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posttype" do
    assert_difference('Posttype.count') do
      post :create, posttype: { name: @posttype.name }
    end

    assert_redirected_to posttype_path(assigns(:posttype))
  end

  test "should show posttype" do
    get :show, id: @posttype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posttype
    assert_response :success
  end

  test "should update posttype" do
    patch :update, id: @posttype, posttype: { name: @posttype.name }
    assert_redirected_to posttype_path(assigns(:posttype))
  end

  test "should destroy posttype" do
    assert_difference('Posttype.count', -1) do
      delete :destroy, id: @posttype
    end

    assert_redirected_to posttypes_path
  end
end
