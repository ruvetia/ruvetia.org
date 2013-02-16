require "test_helper"

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = Team.new
  end

  test "members can be added to the team" do
    @team << peter = Organizer.new("Peter")
    @team << fritz = Organizer.new("Fritz")
    assert_equal [peter, fritz], @team.members
  end

  test "iterating through the team loops through the members" do
    @team << jane = Organizer.new("Jane")
    @team << lea = Organizer.new("Lea")

    entries = []
    @team.each do |member|
      entries << member
    end

    assert_equal [jane, lea], entries
  end

end
