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
