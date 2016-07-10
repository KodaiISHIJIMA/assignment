require('test/unit')
load('./digit-sum.rb')

class TC_Area < Test::Unit::TestCase
  def test_digit_sum
    assert_equal(30, digit_sum(9876))
    assert_equal(4, digit_sum(1111))
  end
end
