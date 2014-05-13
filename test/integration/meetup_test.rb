require 'test_helper'
require 'mock/github'

class MeetupPageTest < ActionDispatch::IntegrationTest

  test "the home displays the upcomming meetups" do
    visit '/'
    meetups = page.all('.meetups li h3').map(&:text)
    assert_equal ['Ruvetia #6, Bern'], meetups
  end

  test "you can attend a meetup using github" do
    visit '/'
    sign_in_with_github
    attend_upcoming_meetup

    assert_equal 1, Member.count
    assert_equal 1, Participation.count

    click_on "1 rubyist will attend"
    json = JSON.parse(body)
    assert_equal [{"name"=>"Max Molini", "github"=>"max"}], json
  end

  test "you can cancel a meetup participation" do
    create_member!

    visit '/'
    sign_in_with_github
    attend_upcoming_meetup
    within(".meetup-signup") do
      click_link "I can't make it!"
    end

    assert_equal 1, Member.count
    assert_equal 0, Participation.count

    visible_participants = page.all('.meetups .meetup-participants li')
    assert_equal [], visible_participants.map(&:text)
  end

  private
  def sign_in_with_github
    within(".meetup-signup") do
      click_link "Sign in using GitHub"
    end
  end

  def attend_upcoming_meetup
    within(".meetup-signup") do
      click_link "I will be there!"
    end
  end
end
