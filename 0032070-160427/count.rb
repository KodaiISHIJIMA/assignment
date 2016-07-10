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

def count(field, r, c)
  sum = 0
  for i in -1..1
    for j in -1..1
      if (i != 0 or j != 0)
        if is_living_cell(field, r+i, c+j) == 1
          sum += 1
        end
      end
    end
  end
  return sum
end

a = [[1,1,0],[1,1,1],[1,1,1]]
p count(a, 1, 1)
