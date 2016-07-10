require('test/unit')
load('./display.rb')

class TC_Area < Test::Unit::TestCase
  def test_display
    t0 = make_answer_node("a")
    t1 = make_question_node("a", t0, nil)
    t2 = make_question_node("a", nil, t0)
    t3 = make_question_node("a", t0, t0)
    
    assert_equal(false, is_question_node(t0))
    assert_equal(true, is_question_node(t1))
    assert_equal(true, is_question_node(t2))
    assert_equal(true, is_question_node(t3))
  end
end
