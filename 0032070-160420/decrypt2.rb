# coding: utf-8
def decrypt2(x)
  a = ""
  b = ""
  flag = 1
  
  for i in 0..x.size-1
    if i % 4 == 0
      flag = 1
    elsif i % 2 == 0 && i % 4 != 0
      flag = 0
    end

    # この時点でaにはiまでの入る文字列、bにはiまでの入る文字列が入ってる
    if flag == 1
      a += x[i,1]
    else
      b += x[i,1]
    end
  end
  [a,b]
end

p decrypt2("takinutukine")
