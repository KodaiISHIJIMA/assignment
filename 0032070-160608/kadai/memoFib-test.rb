require('test/unit')
load('memoFib.rb')

class TC_Area < Test::Unit::TestCase
  def test_memoFib
    m = MemoFib.new
    assert_equal(55, m.fib(10))
    assert_equal(11, m.counter)
    assert_equal(6765, m.fib(20))
    assert_equal(21, m.counter)
  end
end
