require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest

  test "the home displays the ruvetia organizers" do
    visit '/team'
    members = page.all('.team li h3')
    assert_equal ["Yves Senn", "Rodrigo Haenggi", "Daniel Puglisi", "Kaspar Schiess", "Ferdinand Niedermann"], members.map(&:text)
  end

end
