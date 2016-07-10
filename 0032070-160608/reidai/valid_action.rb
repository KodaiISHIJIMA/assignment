Cooperate = 0
Defect = 1
def valid_action(act)
  return act == Cooperate || act == Defect
end

Reward = [
  [2,0],
  [3,1],
]
