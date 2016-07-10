# coding: utf-8
# 新たな二次元配列を作成する
def make2d(height, width)
  a = Array.new(height)
  for i in 0..height-1
    a[i] = Array.new(width, 0)
  end
  a
end

# livingで生きているとされるマスだけが1で、
# 他は0になっている配列を作成する
def make_field(height, width, living)
  a = make2d(height, width)
  for i in 0..living.length-1
    a[living[i][0]][living[i][1]] = 1
  end
  a
end

# 指定されたマスがfield内にあるか判定する
def inside(field, r, c)
  h = field.length
  w = field[0].length
  0 <= r and r < h and 0 <= c and c < w
end

# 指定したマスの生死を判断する
def is_living_cell(field, r, c)
  if inside(field, r, c)
    return field[r][c]
  else
    return 0
  end
end

# 指定したマスの近傍で生きているマスの数を返す
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

# 指定したマスが次のステージで生きているか判断する
def next_cell_living(living, neighbor_count)
  if neighbor_count == 3
    return 1
  elsif neighbor_count == 2
    if living == 1
      return 1
    else
      return 0
    end
  else
    return 0
  end
end

# fieldが与えられたときの次のステージのfieldを返す
def next_field(a)
  b = make2d(a.length, a[0].length)
  for i in 0..a.length-1
    for j in 0..a[0].length-1
      living = a[i][j]
      neighbor_count = count(a, i, j)
      b[i][j] = next_cell_living(living, neighbor_count)
    end
  end
  return b
end

def update(src, dst)
  for r in 0..src.length-1
    for c in 0..dst.length-1
      dst[r][c] = src[r][c]
    end
  end
end

def demo(initial, step)
  field = initial
  show(field)
  for t in 1..step
    new_field = next_field(field)
    update(new_field, field)
    sleep 0.1
  end
end

a = [[0,1,0,0,0],[0,0,1,0,0],[1,1,1,0,0],[0,0,0,0,0],[0,0,0,0,0]]
p next_field(a)

# test_glider
# glider=[[0,1],[1,2],[2,0],[2,1],[2,2]]
# demo(make_field(15,15,glider), 50)

# test_lightweight_spaceship
# l_spaceship = [[1,11],[1,14],[2,10],[3,10],[3,14],[4,10],[4,11],[4,12],[4,13]]
# demo(make_field(15,15,l_spaceship), 50)
