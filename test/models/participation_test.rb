require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase

  test "needs a member" do
    participation = Participation.new
    assert_not participation.valid?
    assert_equal ["can't be blank"], participation.errors[:member]
  end

  test "needs a meetup_id" do
    participation = Participation.new
    assert_not participation.valid?
    assert_equal ["can't be blank"], participation.errors[:meetup_number]
  end

  test "a member can't attend twice at the same meetup" do
    peter = Member.create!(name: 'Peter')
    Participation.create!(:member => peter, :meetup_number => 32)

    assert_raises(ActiveRecord::RecordInvalid) do
      Participation.create!(:member => peter, :meetup_number => 32)
    end
  end
end
