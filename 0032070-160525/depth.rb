def depth(tree)
  if is_empty(tree)
    -1
  elsif depth(left(tree)) > depth(right(tree))
    1 + depth(left(tree))
  else
    1 + depth(right(tree))
  end
end
