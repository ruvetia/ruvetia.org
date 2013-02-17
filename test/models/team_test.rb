require "test_helper"

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = Team.new
  end

  test "members can be added to the team" do
    @team << peter = Organizer.new(:peter, "Peter")
    @team << fritz = Organizer.new(:fritz, "Fritz")
    assert_equal [peter, fritz], @team.members
  end

  test "iterating through the team loops through the members" do
    @team << jane = Organizer.new(:jane, "Jane")
    @team << lea = Organizer.new(:lea, "Lea")

    entries = []
    @team.each do |member|
      entries << member
    end

    assert_equal [jane, lea], entries
  end

  test "a member can be found by its nick" do
    @team << petra = Organizer.new(:petra, "Petra")
    @team << lara = Organizer.new(:lara, "Lara")

    assert_equal lara, @team.member(:lara)
    assert_equal petra, @team.member(:petra)
  end

end
