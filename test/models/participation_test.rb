require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase
  test "a member can't attend twice at the same meetup" do
    peter = Member.create!(name: 'Peter')
    Participation.create!(:member => peter, :meetup_number => 32)

    assert_raises(ActiveRecord::RecordInvalid) do
      Participation.create!(:member => peter, :meetup_number => 32)
    end
  end
end
