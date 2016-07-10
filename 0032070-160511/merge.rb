def merge(a, b)
  c = []
  while a.length > 0 && b.length > 0
    if a[0] < b[0]
      c << a.shift
    else
      c << b.shift
    end
  end
  c += a
  c += b
  return c
end
