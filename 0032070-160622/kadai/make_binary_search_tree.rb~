# coding: utf-8
def make_binary_search_tree(a)
  tree = EmptyTree
  for i in 0..a.length-1
    tree = add_node(tree, a[i])
  end
  tree
end

def add_node(tree, x)
  # 木がないので葉を作る
  if is_empty(tree)
    make_leaf(x)
  # xが親よりも小さければ、左の子以下の木とxでこの作業を繰り返す
  elsif x < value(tree)
    make_node(value(tree), add_node(left(tree), x), right(tree))
  # xが親よりも大きければ、右の子以下の木とxでこの作業を繰り返す
  else
    make_node(value(tree), left(tree), add_node(right(tree), x))
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
