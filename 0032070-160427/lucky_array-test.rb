require('test/unit')
load('./lucky_array.rb')

class TC_Area < Test::Unit::TestCase
  def test_lucky_array
    lucky_numbers = Array.new(30, false)
    lucky_numbers[7] = true
    lucky_numbers[14] = true
    lucky_numbers[21] = true
    lucky_numbers[28] = true
    lucky_numbers[16] = true
    lucky_numbers[25] = true
    assert_equal(lucky_numbers, lucky_array(30))
  end
end
    
