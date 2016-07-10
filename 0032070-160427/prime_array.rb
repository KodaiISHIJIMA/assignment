# coding: utf-8
include Math

# 素数の添字の要素のみをtrueにしていく
def prime_array_index(n)
  a = Array.new(n, true)
  a[0] = false
  a[1] = false
  for i in 2..Math.sqrt(n).floor
    if a[i] == true
      j = 2
      while i*j < n
        a[i*j] = false
        j += 1
      end
    end
  end
  return a
end

# prime_array_indexにより要素がtrueになっている
# 添字を新たな配列に格納していく
def prime_array(n)
  a = prime_array_index(n)
  b =[]
  for i in 0..n-1
    if a[i] == true
      b << i
    end
  end
  b
end
