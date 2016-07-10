# coding: utf-8
def max_value(tree)
  if is_empty(tree)
    0
  else
    # 親と左の子以下の最大値と右の子以下の最大値の3つの中で最大のものを返している
    [value(tree), max_value(left(tree)), max_value(right(tree))].max
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
