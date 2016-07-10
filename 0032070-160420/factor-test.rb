require('test/unit')
load('./factor.rb')

class TC_Area < Test::Unit::TestCase
  def test_factor
    assert_equal([1,13], factor(13))
    assert_equal([1,2,4,8,16,32], factor(32))
  end
end
