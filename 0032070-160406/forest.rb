tree_scales = [3,5,7,8]

for i in 0..tree_scales.length
  for j in 1..(tree_scales[i]+1)
    print " " * (tree_scales[i]+1-j)
    print "*" * (2*j-1)
    print " " * (tree_scales[i]+1-j)
  end
  print "\n"
end

for i in 1..N
  print " " * N
  print "*"
  print " " * N
  print "\n"
end
