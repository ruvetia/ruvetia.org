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
    click_link "Sign in using Github"
    click_link "I will be there!"

    assert_equal 1, Member.count
    assert_equal 1, Participation.count

    # visible_participants = page.all('.meetups .meetup-participants li')
    # assert_equal ['Max Molini'], visible_participants.map(&:text)
  end

  test "you can cancel a meetup participation" do
    max = create_member!
    max.attend(1)

    visit '/'
    click_link "Sign in using Github"
    click_link "I can't make it!"

    assert_equal 1, Member.count
    assert_equal 0, Participation.count

    visible_participants = page.all('.meetups .meetup-participants li')
    assert_equal [], visible_participants.map(&:text)
  end
end
