# coding: utf-8
include Math

# 各桁の和を返す
def digit_sum(n)
  sum = 0
  digit = log10(n).floor+1
  for i in 1..digit
    sum += (n % 10**i) / 10**(i-1)
  end
  return sum
end

# 7の倍数か各桁の和が7の倍数を配列に加えてそれを返す
def lucky_array(n)
  a = Array.new(n, false)
  for i in 1..n-1
    # 7の倍数
    if i % 7 == 0
      a[i] = true
    # 各桁の和が7の倍数
    elsif digit_sum(i) % 7 == 0
      a[i] = true
    end
    # ループ不変条件は、
    # ここまでに7の倍数か各桁の和が7の倍数の数のみがtrue
  end
  # ここまでに7の倍数か各桁の和が7の倍数の数のみがtrue
  a
end
