require 'test_helper'

class RepresentationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers  

  def setup
    user = FactoryGirl.create(:user)
    sign_in user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
