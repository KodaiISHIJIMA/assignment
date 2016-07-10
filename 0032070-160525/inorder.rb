# coding: utf-8
def inorder(tree)
  if is_empty(tree)
    []
  else
    # inorderの順に配列に入れられた左の子、その親、inorderの順に配列に入れられた右の子の順に配列に入れている
    inorder(left(tree)) + [value(tree)] + inorder(right(tree))
  end
end

def make_node(num, left, right)
  [num, left, right]
end

def value(tree)
  tree[0]
end

def left(tree)
  tree[1]
end

def right(tree)
  tree[2]
end

EmptyTree = nil
def is_empty(tree)
  tree == EmptyTree
end

def make_leaf(num)
  make_node(num, EmptyTree, EmptyTree)
end
