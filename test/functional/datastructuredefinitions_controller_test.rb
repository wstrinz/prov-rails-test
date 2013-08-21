require 'test_helper'

class DatastructuredefinitionsControllerTest < ActionController::TestCase
  setup do
    @datastructuredefinition = datastructuredefinitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datastructuredefinitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datastructuredefinition" do
    assert_difference('Datastructuredefinition.count') do
      post :create, datastructuredefinition: { component: @datastructuredefinition.component }
    end

    assert_redirected_to datastructuredefinition_path(assigns(:datastructuredefinition))
  end

  test "should show datastructuredefinition" do
    get :show, id: @datastructuredefinition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datastructuredefinition
    assert_response :success
  end

  test "should update datastructuredefinition" do
    put :update, id: @datastructuredefinition, datastructuredefinition: { component: @datastructuredefinition.component }
    assert_redirected_to datastructuredefinition_path(assigns(:datastructuredefinition))
  end

  test "should destroy datastructuredefinition" do
    assert_difference('Datastructuredefinition.count', -1) do
      delete :destroy, id: @datastructuredefinition
    end

    assert_redirected_to datastructuredefinitions_path
  end
end
