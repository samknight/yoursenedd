require 'test_helper'

class WeeklyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should add flash response if confirmed" do
    get :index, confirmation: true
    assert_not_nil flash[:confirmation]
  end
end
