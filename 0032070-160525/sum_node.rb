def sum_node(tree)
  if is_empty(tree)
    0
  else
    value(tree) + sum_node(left(tree)) + sum_node(right(tree))
  end
end
