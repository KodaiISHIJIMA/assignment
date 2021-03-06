require('test/unit')
load('./sigmoid_inverse.rb')

class TC_Area < Test::Unit::TestCase
  def test_sigmoid_intense
    assert_in_delta(0.0, sigmoid_inverse(0.5, -10, 10), 0.0001)
    assert_in_delta(-1.38671875, sigmoid_inverse(0.2, -10, 10), 0.0001)
    assert_in_delta(-2.197265625, sigmoid_inverse(0.1, -10, 10), 0.0001)
    assert_in_delta(2.197265625, sigmoid_inverse(0.9, -10, 10), 0.0001)
  end
end
