require('test/unit')
load('./tanuki.rb')

class TC_Area < Test::Unit::TestCase
  def test_tanuki
    assert_equal("toukyouto", erase_ta("tatotauktayotauttao"))
    assert_equal("jouhou", erase_ta("jotauhtaou"))
    assert_equal("jouhou", erase_ta("tatata"))
  end
end
