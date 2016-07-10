require('test/unit')
load('./extend_sum.rb')

class TC_Area < Test::Unit::TestCase
  def test_extens_sum
    a = [[1,2,3],[10,20,30]]
    b = [[1,2,3,6],[10,20,30,60],[11,22,33,66]]
    assert_equal(b, extend_sum(a))
  end
end
    
