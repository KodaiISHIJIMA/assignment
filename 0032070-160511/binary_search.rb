# coding: utf-8
# 二分探索
# aは配列、xは探す要素, l,rは探す範囲
def bs(a,x,l,r)
  m = (l+r) / 2
  # 探す要素がl番目のものだけで、それが探しているもののとき
  if l + 1 == r and a[l] == x
    return l
  # 探す要素がl番目のものだけで、それが探しているものでないとき
  elsif l + 1 == r and a[l] != x
    return -1
  # 探しているものがm番目のものより小さいとき
  elsif l + 1 < r and a[m] > x
    return bs(a,x,l,m)
  # 探しているものがm番目の要素より大きいとき
  else
    return bs(a,x,m,r)
  end
end
