N = 7

for i in 1..(N+1)
  print " " * (N+1-i)
  print "*" * (2*i-1)
  print " " * (N+1-i)
  print "\n"
end

for i in 1..N
  print " " * N
  print "*"
  print " " * N
  print "\n"
end
