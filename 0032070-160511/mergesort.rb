# coding: utf-8
# 昇順に整列された2つの配列を昇順に1つの配列に合併する
def merge(a, b)
  c = []
  while a.length > 0 && b.length > 0
    if a[0] < b[0]
      c << a.shift
    else
      c << b.shift
    end
  end
  c += a
  c += b
  return c
end

# 配列を半分にして前半を返す
def first_half(a)
  if a.length % 2 != 0
    return a[0..(a.length/2)]
  else
    return a[0..(a.length/2-1)]
  end
end

# 配列を半分にして後半を返す
def second_half(a)
  if a.length % 2 != 0
    return a[a.length/2+1..a.length]
  else
    return a[a.length/2..a.length]
  end
end

def mergesort(a)
  if a.length <= 1
    return a
  end
  
  f_half = first_half(a)
  s_half = second_half(a)

  # 分解して昇順にソートされたものを昇順に合併する
  return merge(mergesort(f_half), mergesort(s_half))
end
