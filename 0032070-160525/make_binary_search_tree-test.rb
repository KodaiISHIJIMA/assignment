require('test/unit')
load('./make_binary_search_tree.rb')

class TC_Area < Test::Unit::TestCase
  def test_make_binary_search_tree
    assert_equal([3, [1, [0, nil, nil], [1, nil, [2, nil, nil]]], [6, [5, nil, nil], [7, nil, [9, nil, nil]]]], make_binary_search_tree([3,1,6,1,7,9,2,0,5]))
  end
end
