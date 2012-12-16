require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:joe).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variable are assigned on successfule profile viewing" do
  	get :show, id: users(:joe).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:collections)
  end

  test "only shows the correct user's collections" do
    get :show, id: users(:jason).profile_name
    assigns(:collections).eac do |collection|
      assert_equal users(:joe), collection.user
    end
end
