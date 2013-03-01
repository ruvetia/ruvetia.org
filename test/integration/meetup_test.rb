require 'test_helper'
require 'mock/github'

class MeetupPageTest < ActionDispatch::IntegrationTest

  test "the home displays the upcomming meetups" do
    visit '/'
    meetups = page.all('.meetups li h3').map(&:text)
    assert_equal ['Ruvetia #1, Bern'], meetups
  end

  test "you can attend a meetup using github" do
    visit '/'
    click_link "I will be there!"

    assert_equal 1, Member.count
    assert_equal 1, Participation.count

    # TODO: Verify participation on screen
  end

end
