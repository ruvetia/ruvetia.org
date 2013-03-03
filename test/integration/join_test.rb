require 'test_helper'
require 'mock/github'

class JoinPageTest < ActionDispatch::IntegrationTest

  test "you can join using GitHub" do
    join_link_text = "Join / Sign in using GitHub"
    visit '/'
    within(".intro-text") do
      click_link join_link_text
    end

    assert_equal 1, Member.count

    assert_raises(Capybara::ElementNotFound) { find_link join_link_text }
  end

end
