require 'test_helper'

class Members::SpeechesControllerTest < ActionController::TestCase
  test "should get index" do
    key = FactoryGirl.create(:api_key)
    get :index, { member_id: key.member_id, uuid: key.uuid }, format: :json
    assert_response :success
  end

  # TODO: SHould be 401
  test "invalid code should return 401" do
    get :index, { member_id: 1, uuid: '1213141av12' }, format: :json
    assert_response 401
  end

  # TODO: SHould be 401
  test "incorrect member should return 401" do
    key = FactoryGirl.create(:api_key)
    get :index, { member_id: 1, uuid: key.uuid }, format: :json
    assert_response 401
  end

end
