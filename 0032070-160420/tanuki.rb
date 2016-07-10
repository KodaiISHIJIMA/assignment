# coding: utf-8
def erase_ta(x)
  # x = x.gsub("ta","")
  
  for i in 0..x.size-1
    # この時点でxの0からi-1、またはiまでに元の文字列にあった"ta"は含まれていない
    if x[i,2] == "ta"
      x[i,2] = ""
    end
  end
  
  return x
end

p erase_ta("tatotauktayotauttao")
p erase_ta("tatata")