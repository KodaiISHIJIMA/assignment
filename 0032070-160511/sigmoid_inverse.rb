# coding: utf-8
Epsilon = 0.0001

# シグモイド関数
# シグモイド関数は単調増加
def sigmoid(x)
  return 1/(1 + Math.exp(-x))
end

# シグモイド関数の逆関数
def sigmoid_inverse(y,a,b)
  m = (a+b)/2.0
  # xがmのときのyの値が許容範囲であればmを返す
  if (y - sigmoid(m)).abs < Epsilon
    return m
  # xがmより大きいとき
  elsif y - sigmoid(m) > 0
    return sigmoid_inverse(y,m,b)
  # xがmより小さいとき
  else
    return sigmoid_inverse(y,a,m)
  end
end
