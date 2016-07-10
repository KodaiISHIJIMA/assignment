# coding: utf-8
def calc(tree)
  # 子を1つも持たないときはそのノードの値を返す
  if is_empty(left(tree)) and is_empty(right(tree))
    value(tree)
  # 子を持つ場合そのノードは演算子なので、左の子以下と右の子以下でその演算子に合わせた計算をする
  else
    if value(tree) == "+"
      calc(left(tree)) + calc(right(tree))
    elsif value(tree) == "-"
      calc(left(tree)) - calc(right(tree))
    elsif value(tree) == "*"
      calc(left(tree)) * calc(right(tree))
    else
      calc(left(tree)) / calc(right(tree))
    end
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
