require 'test_helper'

class MeetupTest < ActiveSupport::TestCase

  test "a Meetup has a date and a city" do
    basel_drinkup = Meetup.new(city: 'Basel', time: '05.02.2012 17:40'.to_time)
    assert_equal 'Basel', basel_drinkup.city
    assert_equal '05. February, 17:40 Uhr', basel_drinkup.date
  end

  test "accepts the time as String" do
    bern_drinkup = Meetup.new(city: 'Basel', time: '22.12.2011 10:51'.to_time)
    assert_equal '22. December, 10:51 Uhr', bern_drinkup.date
  end

  test "the default title contains the meetup number" do
    drinkup = Meetup.new(number: 27)
    assert_equal 'Ruvetia #27', drinkup.title
  end

  test "a title can be supplied" do
    drinkup = Meetup.new(title: "Special evening")
    assert_equal 'Special evening', drinkup.title
  end

  test "a location can be supplied" do
    drinkup = Meetup.new(location: 'Altes Tramdepot')
    assert_equal 'Altes Tramdepot', drinkup.location
  end

  test "the default location is unknown" do
    drinkup = Meetup.new
    assert_equal 'TBA', drinkup.location
  end

  test "members participate in meetups" do
    meetup = Meetup.new(number: 83)
    john = Member.create!(name: "John")
    jane = Member.create!(name: "Jane")
    jane.attend(83)

    assert_equal [jane], meetup.participants
    john.attend(83)
    assert_equal [jane, john], meetup.participants
  end

end
