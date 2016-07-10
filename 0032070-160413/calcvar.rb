# kaneko-sensei

def make_term(c)
  if c == "x"
    lambda{|x|
      x.to_i
    }
    
  else
    lambda{|x|
      c.to_i
    }
  end
end

def parse(s)
  f, size = parse_term(s)
  f
end

def parse_term(s)
  if s[0] == "("
    lf, lsize = parse_term(s[1..s.size])
    op = s[lsize+1]
    rf, rsize = parse_term(s[lsize+2..s.size])
    f = lambda{|x|
      calculator(lf.call(x), op, rf.call(x))
    }
    [f, s.size]
  else
    f = make_term(s[0])
    [f, 1]
  end
end

# def parse_term(s)
#   arr = Array.new(2)
#   formula = s[s.index("(")+1...s.index("(")+4]
#   arr[0] = parse_one(formula)
#   arr[1] = s.index(")") + 1
#   return arr
# end

def parse_one(s)
  lf = make_term(s[0])
  op = s[1]
  rf = make_term(s[2])
  lambda{|x|
    calculator(lf.call(x), op, rf.call(x))
  }
end

def calculator(a, op, b)
  if op == "+"
    return a + b
    
  elsif op == "-"
    return a - b

  elsif op == "*"
    return a * b

  else
    return a / b
  end
end
