# coding: utf-8
require('test/unit')
load('./idougata.rb')

class TC_Area < Test::Unit::TestCase
  def test_idougata
    # test glider
    # 1周期後と比較
    glider = [[0,1],[1,2],[2,0],[2,1],[2,2]]
    glider_next = [[1,2],[2,3],[3,1],[3,2],[3,3]]
    assert_equal(make_field(15,15,glider_next), demo_test(make_field(15,15,glider), 4))

    # test lightweight spaceship
    # 1周期後と比較
    l_spaceship = [[1,11],[1,14],[2,10],[3,10],[3,14],[4,10],[4,11],[4,12],[4,13]]
    l_spaceship_next =  [[1,9],[1,12],[2,8],[3,8],[3,12],[4,8],[4,9],[4,10],[4,11]]
    assert_equal(make_field(15,15,l_spaceship_next), demo_test(make_field(15,15,l_spaceship), 4))
  end
end
    
