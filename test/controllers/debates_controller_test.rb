require 'test_helper'

class DebatesControllerTest < ActionController::TestCase

  test "get the index page" do
    get :index
    assert_response :success
  end

  test "show an individual debate" do
    debate = FactoryGirl.create(:debate, log_date: Date.parse('2011-05-05'), name: 'title')
    get :show, id: "2011-05-05-title"

    assert_response :success
    assert_not_nil assigns(:debate)
  end

  test "raises a record not found exception if no matching debate" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, id: "no-record"
    end
  end
end
