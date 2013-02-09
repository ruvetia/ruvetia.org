require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest

  test "the home works" do
    visit '/'
    find_link 'Google Group' # make sure the link exists
  end

end
