def count_multiples(n,m)
  if n == 0
    return 0
  elsif n % m == 0
    return 1 + count_multiples(n-1,m)
  else
    return count_multiples(n-1,m)
  end
end
