require 'test_helper'

class Admin::PodcastsControllerTest < ActionController::TestCase
  setup do
    @admin_podcast = admin_podcasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_podcasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_podcast" do
    assert_difference('Admin::Podcast.count') do
      post :create, admin_podcast: {  }
    end

    assert_redirected_to admin_podcast_path(assigns(:admin_podcast))
  end

  test "should show admin_podcast" do
    get :show, id: @admin_podcast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_podcast
    assert_response :success
  end

  test "should update admin_podcast" do
    patch :update, id: @admin_podcast, admin_podcast: {  }
    assert_redirected_to admin_podcast_path(assigns(:admin_podcast))
  end

  test "should destroy admin_podcast" do
    assert_difference('Admin::Podcast.count', -1) do
      delete :destroy, id: @admin_podcast
    end

    assert_redirected_to admin_podcasts_path
  end
end
