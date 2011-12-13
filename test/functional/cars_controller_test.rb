require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post :create, :car => @car.attributes
    end

    assert_redirected_to car_path(assigns(:car))
  end

  test "should show car" do
    get :show, :id => @car.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @car.to_param
    assert_response :success
  end

  test "should update car" do
    put :update, :id => @car.to_param, :car => @car.attributes
    assert_redirected_to car_path(assigns(:car))
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete :destroy, :id => @car.to_param
    end

    assert_redirected_to cars_path
  end
end
