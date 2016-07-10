require('test/unit')
load('./next_field.rb')

class TC_Area < Test::Unit::TestCase
  def test_next_field
    a = [[0,1,0,0,0],[0,0,1,0,0],[1,1,1,0,0],[0,0,0,0,0],[0,0,0,0,0]]
    a_next = [[0,0,0,0,0],[1,0,1,0,0],[0,1,1,0,0],[0,1,0,0,0],[0,0,0,0,0]]
    b = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
    b_next = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]]
    assert_equal(a_next, next_field(a))
    assert_equal(b_next, next_field(b))
  end
end
    
