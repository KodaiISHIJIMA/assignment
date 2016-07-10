# coding: utf-8
def factor(n)
  a = []
  for i in 1..n
    # この時点でaに1からi-1までのnの約数が入っている
    if n % i == 0
      a << i
    end
  end
  return a
end


p factor(99)
