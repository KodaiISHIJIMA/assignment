require('test/unit')
load('./in_range.rb')

class TC_Area < Test::Unit::TestCase
  def test_range
    assert_equal(true, in_range(1,2,3))
    assert_equal(false, in_range(3,1,3))
  end
end
