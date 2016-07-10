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
