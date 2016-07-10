def preorder(tree)
  if is_empty(tree)
    []
  else
    [value(tree)] + preorder(left(tree)) + preorder(right(tree))
  end
end
