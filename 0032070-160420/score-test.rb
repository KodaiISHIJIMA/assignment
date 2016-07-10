require('test/unit')
load('./score.rb')

class TC_Area < Test::Unit::TestCase
  def test_score
    assert_equal(5, score([1,2,3,4]))
    assert_equal(10, score([0,1,1,8,12]))
  end
end
