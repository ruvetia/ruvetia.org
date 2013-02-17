require 'test_helper'

class NoWwwTest < ActionDispatch::IntegrationTest

  test "we don't want urls with www" do
    visit 'http://www.example.com/'
    assert_equal "http://example.com/", current_url
  end

end
