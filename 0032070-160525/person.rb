class Person
  attr_reader :height, :weight
  def initialize(height, weight)
    @height = height
    @weight = weight
  end
  
  def bmi
    @weight / (@height/100.0)**2
  end
end
