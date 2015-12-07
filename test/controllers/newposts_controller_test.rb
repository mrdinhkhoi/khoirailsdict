require 'test_helper'

class NewpostsControllerTest < ActionController::TestCase
  setup do
    @newpost = newposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newpost" do
    assert_difference('Newpost.count') do
      post :create, newpost: { count: @newpost.count, description: @newpost.description, image_url: @newpost.image_url, keyword: @newpost.keyword, title: @newpost.title }
    end

    assert_redirected_to newpost_path(assigns(:newpost))
  end

  test "should show newpost" do
    get :show, id: @newpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newpost
    assert_response :success
  end

  test "should update newpost" do
    patch :update, id: @newpost, newpost: { count: @newpost.count, description: @newpost.description, image_url: @newpost.image_url, keyword: @newpost.keyword, title: @newpost.title }
    assert_redirected_to newpost_path(assigns(:newpost))
  end

  test "should destroy newpost" do
    assert_difference('Newpost.count', -1) do
      delete :destroy, id: @newpost
    end

    assert_redirected_to newposts_path
  end
end
