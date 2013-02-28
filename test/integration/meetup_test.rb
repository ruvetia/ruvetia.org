require 'test_helper'

class MeetupPageTest < ActionDispatch::IntegrationTest

  test "the home displays the upcomming meetups" do
    visit '/'
    meetups = page.all('.meetups li h3').map(&:text)
    assert_equal ['Bern: 15. March, 18:00 Uhr'], meetups
  end

end
