def first_half(a)
  if a.length % 2 != 0
    return a[0..(a.length/2)]
  else
    return a[0..(a.length/2-1)]
  end
end

def second_half(a)
  if a.length % 2 != 0
    return a[a.length/2+1..a.length]
  else
    return a[a.length/2..a.length]
  end
end
