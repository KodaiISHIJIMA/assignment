# coding: utf-8
# 要素が全て0の二次元配列を作成
def make2d_extend(height, width)
  a = Array.new(height+1)
  for i in 0..(height)
    a[i] = Array.new(width+1, 0)
  end
  a
end

# 行ごとに和を求める
def rsum(a, r)
  sum = 0
  for i in 0..a[r].length-1
    sum += a[r][i]
  end
  return sum
end

# 列ごとに和を求める
def vsum(a, c)
  sum = 0
  for i in 0..(a.length-1)
    sum += a[i][c]
  end
  return sum
end

# 表計算の関数
def extend_sum(a)
  # 新たな配列bを作成
  b = make2d_extend(a.length, a[0].length)
  sum = 0
  # 元の表の部分を入れる
  for i in 0..a.length-1
    for j in 0..a[0].length-1
      b[i][j] = a[i][j]
      sum += a[i][j]
    end
  end
  # 各行部分の和を求める
  for i in 0..b.length-2
    b[i][b[i].length-1] = rsum(a, i)
  end
  # 各列部分の和を求める
  for i in 0..b[0].length-2
    b[b.length-1][i] = vsum(a, i)
  end
  # 表の要素の総和を求める
  b[a.length][a[0].length] = sum
  return b
end
