require 'test_helper'

class MembersControllerTest < ActionController::TestCase

  test "show an individual member" do
    member = FactoryGirl.create(:member, :current, forename: 'joe', surname: 'bloggs')
    get :show, id: "#{member.id}-joe-bloggs"

    assert_response :success
    assert_not_nil assigns(:member)
  end

  test "raises a record not found exception if no matching member" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, id: "no-record"
    end
  end
end
