require('test/unit')
load('./rectarea.rb')

class TC_Area < Test::Unit::TestCase
  def test_area
    assert_equal(15, rectarea(5,3))
    assert_equal(200, rectarea(10,20))
  end
end
