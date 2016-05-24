require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  test "default should be valid" do
    member = FactoryGirl.build(:member)
    assert_equal true, member.valid?
  end

  test "should not be valid without forename" do
    member = FactoryGirl.build(:member, forename: nil)
    assert_equal false, member.valid?
  end

  test "should not be valid without surname" do
    member = FactoryGirl.build(:member, surname: nil)
    assert_equal false, member.valid?
  end

  test "#slug should add a slug before save" do
    member = FactoryGirl.create(:member)
    assert_not_nil member.slug
  end

  test "#slug should adhere to format {id}-{name}" do
    member = FactoryGirl.create(:member, id: 1, forename: 'new', surname: 'member')
    assert_equal '1-new-member', member.slug
  end

  test "#to_param should return the slug" do
    member = FactoryGirl.create(:member, id: 1, forename: 'new', surname: 'member')
    assert_equal member.slug, member.to_param
  end

  test "#name should concatenate a full name" do
    member = FactoryGirl.build(:member)
    assert_equal 'Carwyn Jones', member.name
  end

  test "#current? should be true if end date is not set" do
    member = FactoryGirl.build(:member, :current)
    assert_equal true, member.current?
  end

  test "#current? should be false if end date is set" do
    member = FactoryGirl.build(:member, :left)
    assert_equal false, member.current?
  end

  test "#entered_senedd should return a date" do
    member = FactoryGirl.build(:member, :current)
    assert_kind_of Date, member.entered_senedd
  end

  test "#entered_senedd should return date of first representation" do
    member = FactoryGirl.build(:member, :current)
    assert_equal Date.parse('1999-05-06'), member.entered_senedd
  end

  test "#left_senedd should return a date" do
    member = FactoryGirl.build(:member, :left)
    assert_kind_of Date, member.left_senedd
  end

  test "#left_senedd should return date of last representation" do
    member = FactoryGirl.build(:member, :left_two_representations)

    assert_equal Date.parse('2011-05-04'), member.left_senedd
  end
end
