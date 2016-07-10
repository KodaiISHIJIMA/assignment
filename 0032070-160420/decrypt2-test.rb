require('test/unit')
load('./decrypt2.rb')

class TC_Area < Test::Unit::TestCase
  def test_decrypt2
    assert_equal(["tanuki", "kitune"], decrypt2("takinutukine"))
    assert_equal(["rinngo", "mikann"], decrypt2("riminnkagonn"))
  end
end
