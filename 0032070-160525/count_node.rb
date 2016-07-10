def count_node(tree)
  if is_empty(tree)
    0
  else
    1 + count_node(left(tree)) + count_node(right(tree))
  end
end
