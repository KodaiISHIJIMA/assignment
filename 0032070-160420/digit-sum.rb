# coding: utf-8
include Math

def digit_sum(n)
  sum = 0
  digit =  log10(n).floor+1
  for i in 1..digit
    amari = n % 10**i
    value = amari / 10**(i-1)
    # p value
    # この時点でsumに1の位からi-1の位までの数字が足されている
    sum +=  value
  end
  return sum
end

p digit_sum(9876)
