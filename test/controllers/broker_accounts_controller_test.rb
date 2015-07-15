require 'test_helper'

class BrokerAccountsControllerTest < ActionController::TestCase
  setup do
    @broker_account = broker_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:broker_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create broker_account" do
    assert_difference('BrokerAccount.count') do
      post :create, broker_account: { broker_id: @broker_account.broker_id, name: @broker_account.name, user_id: @broker_account.user_id }
    end

    assert_redirected_to broker_account_path(assigns(:broker_account))
  end

  test "should show broker_account" do
    get :show, id: @broker_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @broker_account
    assert_response :success
  end

  test "should update broker_account" do
    patch :update, id: @broker_account, broker_account: { broker_id: @broker_account.broker_id, name: @broker_account.name, user_id: @broker_account.user_id }
    assert_redirected_to broker_account_path(assigns(:broker_account))
  end

  test "should destroy broker_account" do
    assert_difference('BrokerAccount.count', -1) do
      delete :destroy, id: @broker_account
    end

    assert_redirected_to broker_accounts_path
  end
end
