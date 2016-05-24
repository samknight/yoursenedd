require 'test_helper'

class DebateTest < ActiveSupport::TestCase

  test "should add a slug before save" do
    debate = FactoryGirl.create(:debate)
    assert_not_nil debate.slug
  end

  test "should adhere to format {log_date}-{name}" do
    debate = FactoryGirl.create(:debate)
    assert_equal '2015-01-01-big-debate', debate.slug
  end

  test "#first_speech_by should return the first speech by a member" do
    debate = FactoryGirl.create(:debate)
    member = FactoryGirl.create(:member)
    speech = FactoryGirl.create(:speech, content: "First", member: member)
    debate.speeches << speech
    debate.speeches << FactoryGirl.create(:speech, content: "Second", member: member)

    assert_equal speech, debate.first_speech_by(member)
  end

  test "#first_speech_by should return NilSpeech if no speeches by the member" do
    debate = FactoryGirl.create(:debate)
    member = FactoryGirl.create(:member)

    assert_kind_of NilSpeech, debate.first_speech_by(member)
  end

  test "#speaker should return each member who speaks once" do
    debate = FactoryGirl.create(:debate)
    member = FactoryGirl.create(:member)
    debate.speeches << FactoryGirl.create(:speech, member: member)
    debate.speeches << FactoryGirl.create(:speech, member: member)
    debate.speeches << FactoryGirl.create(:speech, member: FactoryGirl.create(:member))

    assert_equal 2, debate.speakers.size
  end
end
