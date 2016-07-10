require('test/unit')
load('./calc.rb')

class TC_Area < Test::Unit::TestCase
  def test_calc
    t = make_node("+", make_node("*", make_leaf(3), make_leaf(5)), make_leaf(2))

    assert_equal(17, calc(t))
  end
end
