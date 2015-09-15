require 'test_helper'

class WebtraderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
