require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "get the index page" do
    get :index
    assert_response :success
  end
end
