# kaneko-sensei

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

print calculator(calculator(3, "*", 10), "+", 7), "\n"
