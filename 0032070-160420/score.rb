# coding: utf-8
def score(a)
  max = a.max
  min = a.min

  sum = 0
  for i in 0..a.length-1
    # この時点でsumの値は0からi-1までの値
    sum = sum + a[i]
  end

  olympic_score = sum - max - min

  return olympic_score
end

p score([1,2,3,4])
