require 'test_helper'

class CollectionsControllerTest < ActionController::TestCase
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collections)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect 
    assert_redirected_to new_user_session_path
  end

  test "should update collection for the current user when logged in" do
    sign_in users(:joe)
    put :update, id: @collection, collection: { title: @collection.title, user_id: users(:jim).id }
    assert_redirected_to collection_path(assigns(:collection))
    assert_equal assigns(:collection).user_id, users(:joe).id
  end

  test "should not update the collection if nothing has changed" do
    sign_in users(:joe)
    put :update, id: @collection
    assert_redirected_to collection_path(assigns(:collection))
    assert_equal assigns(:collection).user_id, users(:joe).id
  end

  test "should render the new page when logged in" do
    sign_in users(:joe)
    get :new
    assert_response :success
  end

  test "should be logged in to create a collection" do
    post :create, collection: { content: "Hello" }
    assert_response :redirect
    assert_redirected_to new_users_session_path
  end

  test "should create collection when logged in" do
    sign_in users(:joe)
    assert_difference('Collection.count') do
      post :create, collection: { description: @collection.description, title: @collection.title }
    end

    test "should create collection for content user when logged in" do
    sign_in users(:joe)

    assert_difference('Collection.count') do
      post :create, collection: { description: @collection.description, user_id(:jim).id }
    end

    assert_redirected_to collection_path(assigns(:collection))
    assert_equal assigns(:status).user_id, users(:jason).id
  end

  test "should show collection" do
    get :show, id: @collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collection
    assert_response :success
  end

  test "should update collection" do
    put :update, id: @collection, collection: { description: @collection.description, name: @collection.name, title: @collection.title }
    assert_redirected_to collection_path(assigns(:collection))
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete :destroy, id: @collection
    end

    assert_redirected_to collections_path
  end
end
