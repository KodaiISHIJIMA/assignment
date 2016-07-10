# coding: utf-8
# 選択した行為を01で表す
Cooperate = 0
Defect = 1

# 選択した行為が正規のものか判断
def valid_action(act)
  return act == Cooperate || act == Defect
end

# 結果
Reward = [
  [2,0],
  [3,1],
]

# Playerの親クラス
class Player
  def name
  end
  def play
  end
  def update(my_action, op_action)
  end
end

class CooperatePlayer < Player
  def name
    "CooperatePlayer"
  end
  def play
    Cooperate
  end
end

class DefectPlayer < Player
  def name
    "DefectPlayer"
  end
  def play
    Defect
  end
end

class RandomPlayer < Player
  def name
    "RandomPlayer"
  end
  def play
    (rand(2)%2 == 0) ? Cooperate : Defect
  end
end

class AlternatePlayer < Player
  def initialize
    # 最初の行為はランダムで決める
    @last_action = (rand(2)%2 == 0) ? Cooperate : Defect
  end
  def name
    "AlternatePlayer"
  end
  def play
    # 最後の行為がCooperateならDefect。そうでないならCooperate。
    if @last_action == Cooperate
      Defect
    else
      Cooperate
    end
  end
  # 最後の自分の行為を記録する
  def update(my_action, op_action)
    @last_action = my_action
  end
end

class TitForTatPlayer < Player
  def initialize
    # 最初の行為をCooperateにするために初期値をCooperateに。
    @last_op_action = Cooperate
  end
  def name
    "TitForTatPlayer"
  end
  def play
    # 最後の相手の行為がDefectならDefectを選ぶ
    if @last_op_action == Defect
      Defect
    else
      Cooperate
    end
  end
  # 最後の相手の行為を記録しておく
  def update(my_action, op_action)
    @last_op_action = op_action
  end
end

def play_one_game(player_a, player_b)
  act_a = player_a.play
  act_b = player_b.play
  raise unless valid_action(act_a)
  raise unless valid_action(act_b)
  reward_a = Reward[act_a][act_b]
  reward_b = Reward[act_b][act_a]

  player_a.update(act_a, act_b)
  player_b.update(act_b, act_a)
  
  # p [player_a.name, "_v.s._", player_b.name]
  # p ["_actions:_", act_a, act_b]
  # p ["_rewards:_", reward_a, reward_b]

  [act_a, reward_a, act_b, reward_b]
end

P = 1.0/8
def play_games(player_a, player_b)
  sum = [0, 0]
  history = ["", ""]
  while true
    act_a, reward_a, act_b, reward_b = play_one_game(player_a, player_b)
    sum[0] += reward_a
    sum[1] += reward_b
    history[0] += act_a.to_s
    history[1] += act_b.to_s
    break if (rand() < P)
  end
  p [sum, history]
end

def test
  pt = TitForTatPlayer.new
  pc = CooperatePlayer.new
  pd = DefectPlayer.new
  pr = RandomPlayer.new
  pa = AlternatePlayer.new

  # TitForTatとそれ以外を戦わせる
  play_games(pt, pc)
  play_games(pt, pd)
  play_games(pt, pr)
  play_games(pt, pa)
end

test
