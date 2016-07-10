require('test/unit')
load('./binary_search.rb')

class TC_Area < Test::Unit::TestCase
  def test_binary_search
    a = [1,3,5,7]
    assert_equal(0, bs(a,1,0,a.length))
    assert_equal(1, bs(a,3,0,a.length))
    assert_equal(2, bs(a,5,0,a.length))
    assert_equal(3, bs(a,7,0,a.length))
    assert_equal(-1, bs(a,2,0,a.length))
  end
end
