require('test/unit')
load('./circle-rect.rb')

class TC_Area < Test::Unit::TestCase
  def test_in_rectangle
    # naka
    assert_equal(true, in_rectangle(4,4,2,2,1))
    # toi
    assert_equal(false, in_rectangle(2,2,50,50,1))
    # migi
    assert_equal(false, in_rectangle(4,4,3.5,2,1))
    # ue
    assert_equal(false, in_rectangle(4,4,2,3.5,1))
    # shita
    assert_equal(false, in_rectangle(4,4,2,0.5,1))
    # hidari
    assert_equal(false, in_rectangle(4,4,0.5,2,1))
  end
end
