require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "get the index page" do
    get :index
    assert_response :success
  end
end
