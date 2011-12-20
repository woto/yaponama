require 'test_helper'

class SearchHistoriesControllerTest < ActionController::TestCase
  setup do
    @search_history = search_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_history" do
    assert_difference('SearchHistory.count') do
      post :create, :search_history => @search_history.attributes
    end

    assert_redirected_to search_history_path(assigns(:search_history))
  end

  test "should show search_history" do
    get :show, :id => @search_history.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @search_history.to_param
    assert_response :success
  end

  test "should update search_history" do
    put :update, :id => @search_history.to_param, :search_history => @search_history.attributes
    assert_redirected_to search_history_path(assigns(:search_history))
  end

  test "should destroy search_history" do
    assert_difference('SearchHistory.count', -1) do
      delete :destroy, :id => @search_history.to_param
    end

    assert_redirected_to search_histories_path
  end
end
