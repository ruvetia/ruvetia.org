require 'test_helper'

class OrganizerTest < ActiveSupport::TestCase

  test "an Organizer needs a name" do
    peter = Organizer.new("Peter")
    assert_equal "Peter", peter.name
  end

  test "an Organizer has a bio" do
    fritz = Organizer.new("Fritz", bio: "Fritz is a hard worker!")
    assert_equal "Fritz is a hard worker!", fritz.bio
  end

  test "an Organizer can be contacted over social media" do
    max = Organizer.new("Max", social_media: { github: 'maximus', twitter: 'maxthegreat' })
    assert_equal({ github: 'maximus', twitter: 'maxthegreat' }, max.social_media)
  end

  test "an Organizer has an image url generated from the gravatar_hash" do
    bob = Organizer.new("Bob", gravatar_hash: "205e460b479e2e5b48aec07710c08d50")
    assert_equal "http://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200", bob.image_url
  end

end
