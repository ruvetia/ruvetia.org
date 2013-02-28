require 'test_helper'

class MeetupTest < ActiveSupport::TestCase

  test "a Meetup has a date and a city" do
    basel_drinkup = Meetup.new(city: 'Basel', time: '05.02.2012 17:40'.to_time)
    assert_equal 'Basel', basel_drinkup.city
    assert_equal '2012-02-05 17:40:00 +0100', basel_drinkup.time.to_s
  end

  test "accepts the time as String" do
    bern_drinkup = Meetup.new(city: 'Basel', time: '22.12.2011 10:51'.to_time)
    assert_equal '2011-12-22 10:51:00 +0100', bern_drinkup.time.to_s
  end

  test "the title is combined from the city and the time" do
    basel_drinkup = Meetup.new(city: 'Zurich', time: '07.07.2001 21:00'.to_time)
    assert_equal 'Zurich: 07. July, 21:00 Uhr', basel_drinkup.title
  end

  test "a location can be supplied" do
    drinkup = Meetup.new(location: 'Altes Tramdepot')
    assert_equal 'Altes Tramdepot', drinkup.location
  end

  test "the default location is unknown" do
    drinkup = Meetup.new
    assert_equal '<<to be announced>>', drinkup.location
  end

end
