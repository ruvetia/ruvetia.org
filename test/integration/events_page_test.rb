require 'test_helper'

class EventsPageTest < ActionDispatch::IntegrationTest

  test "the events page works" do
    visit '/events'
    within "h1" do
      assert_equal("Upcoming and past events", text)
    end
  end

end
