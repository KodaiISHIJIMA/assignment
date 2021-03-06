# coding: utf-8
class Node
  attr_reader :num, :left, :right
  def initialize(num, left, right)
    @num = num
    @left = left
    @right = right
  end

  def value
    @num
  end

  def left
    @left
  end

  def right
    @right
  end
end

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
  Node.new(num, left, right)
end

def value(tree)
  tree.value
end

def left(tree)
  tree.left
end

def right(tree)
  tree.right
end

EmptyTree = nil
def is_empty(tree)
  tree == EmptyTree
end

def make_leaf(num)
  make_node(num, EmptyTree, EmptyTree)
end

