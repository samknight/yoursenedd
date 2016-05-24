require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  def valid_params
    {
      name: Faker::Name.name,
      content: Faker::Lorem.sentence,
      email: Faker::Internet.email
    }
  end

  def invalid_params
    {
      name: Faker::Name.name,
      content: Faker::Lorem.sentence,
      email: nil
    }
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:message)
  end

  test "should create a new mail with valid message" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :create, message: valid_params
    end
    assert_redirected_to message_path
  end

  test "should re-render page if invalid message" do
    post :create, message: invalid_params
    assert_template :new
  end
end
