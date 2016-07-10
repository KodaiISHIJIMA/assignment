def make2d(height, width)
  a = Array.new(height)
  for i in 0..height-1
    a[i] = Array.new(width, 0)
  end
  a
end

def make_field(height, width, living)
  a = make2d(height, width)
  for i in 0..living.length-1
    a[living[i][0]][living[i][1]] = 1
  end
  a
end
