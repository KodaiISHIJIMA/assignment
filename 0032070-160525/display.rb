# coding: utf-8
# 質問文の作成(子を持つのでmake_node)
def make_question_node(question, yes_branch, no_branch)
  make_node(question, yes_branch, no_branch)
end

# 質問文の表示
def question_text(qnode)
  value(qnode)
end

# yesと答えたときの分岐
def question_yes(qnode)
  left(qnode)
end

# noと答えたときの分岐
def question_no(qnode)
  right(qnode)
end

# 答えの作成(子を持たないのでmake_leaf)
def make_answer_node(answer)
  make_leaf(answer)
end

# 答えを表示
def answer_text(anode)
  value(anode)
end

# 問題文か答えかの判定
def is_question_node(node)
  !(is_empty(left(node)) and is_empty(right(node)))
end

def display(node)
  if is_question_node(node) then
    puts "Q:_"+question_text(node)+ "_?_[yn]"
    yn = gets
    if yn.downcase[0,1] == "y" then
      display(question_yes(node))
    else
      display(question_no(node))
    end
  else
    puts "---"
    puts "Answer:_" + answer_text(node)
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

# example1
q1 = make_question_node("Hungry", make_answer_node("cup noodle"), make_answer_node("take a nap"))

display(q1)

# example2
q2_1 = make_question_node("Hissyu", make_answer_node("sougou"), make_answer_node("chikyu"))
q2_2 = make_question_node("gakusai", q2_1, make_answer_node("tougou"))
q2 = make_question_node("komaba_rikei", q2_2, make_answer_node("hongo or bunkei"))

display(q2)
