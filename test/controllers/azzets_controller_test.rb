require 'test_helper'

class AzzetsControllerTest < ActionController::TestCase
  setup do
    @azzet = azzets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:azzets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create azzet" do
    assert_difference('Azzet.count') do
      post :create, azzet: { Name: @azzet.Name, Type: @azzet.Type }
    end

    assert_redirected_to azzet_path(assigns(:azzet))
  end

  test "should show azzet" do
    get :show, id: @azzet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @azzet
    assert_response :success
  end

  test "should update azzet" do
    patch :update, id: @azzet, azzet: { Name: @azzet.Name, Type: @azzet.Type }
    assert_redirected_to azzet_path(assigns(:azzet))
  end

  test "should destroy azzet" do
    assert_difference('Azzet.count', -1) do
      delete :destroy, id: @azzet
    end

    assert_redirected_to azzets_path
  end
end
