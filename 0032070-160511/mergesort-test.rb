require('test/unit')
load('./mergesort.rb')

class TC_Area < Test::Unit::TestCase
  def test_mergesort
    assert_equal([1,2,3,4,5,6,7,8,9], mergesort([8,3,4,1,5,9,6,7,2]))
  end
end
