require 'test_helper'

class AccountBalancesControllerTest < ActionController::TestCase
  setup do
    @account_balance = account_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_balance" do
    assert_difference('AccountBalance.count') do
      post :create, account_balance: { Amount: @account_balance.Amount, BrokerAccount_id: @account_balance.BrokerAccount_id, TradeID: @account_balance.TradeID, Type: @account_balance.Type }
    end

    assert_redirected_to account_balance_path(assigns(:account_balance))
  end

  test "should show account_balance" do
    get :show, id: @account_balance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_balance
    assert_response :success
  end

  test "should update account_balance" do
    patch :update, id: @account_balance, account_balance: { Amount: @account_balance.Amount, BrokerAccount_id: @account_balance.BrokerAccount_id, TradeID: @account_balance.TradeID, Type: @account_balance.Type }
    assert_redirected_to account_balance_path(assigns(:account_balance))
  end

  test "should destroy account_balance" do
    assert_difference('AccountBalance.count', -1) do
      delete :destroy, id: @account_balance
    end

    assert_redirected_to account_balances_path
  end
end
