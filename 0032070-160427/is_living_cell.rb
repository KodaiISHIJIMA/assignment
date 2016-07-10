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

def inside(field, r, c)
  h = field.length
  w = field[0].length
  # p h, w
  0 <= r and r < h and 0 <= c and c < w
end

def is_living_cell(field, r, c)
  if inside(field, r, c)
    return field[r][c]
  else
    return 0
  end
end

p make_field(1,3,[[0,0],[0,1]])

field = make_field(1,3,[[0,0],[0,1]])
p is_living_cell(field, 0, 0)
p is_living_cell(field, 0, 1)
p is_living_cell(field, 0, 2)
p is_living_cell(field, 0, 3)
