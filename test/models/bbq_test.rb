require 'test_helper'

class BbqTest < ActiveSupport::TestCase
  test "the default title contains the bbq number" do
    bbq = Bbq.new(number: 12)
    assert_equal 'BBQ.rb #12', bbq.title
  end
end
