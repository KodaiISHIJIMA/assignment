Epsilon = 0.0001
def sqrt(x,a,b)
  m = (a+b) / 2.0
  if (x - m*m).abs < Epsilon
    m
  elsif m*m > x
    sqrt(x, a, m)
  else
    sqrt(x, m , b)
  end
end
