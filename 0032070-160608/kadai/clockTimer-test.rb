require('test/unit')
load('./clockTimer.rb')

class TC_Area < Test::Unit::TestCase
  def test_clockTimer
    timer = ClockTimer.new(22, 54, 14)
    assert_equal(22, timer.hour)
    assert_equal(54, timer.minute)
    assert_equal(14, timer.second)

    timer.tick
    assert_equal(22, timer.hour)
    assert_equal(54, timer.minute)
    assert_equal(15, timer.second)

    45.times{timer.tick}
    assert_equal(22, timer.hour)
    assert_equal(55, timer.minute)
    assert_equal(0, timer.second)
  end
end
