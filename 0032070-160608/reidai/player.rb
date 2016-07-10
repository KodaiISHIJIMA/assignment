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
    @last_action = (rand(2)%2 == 0) ? Cooperate : Defect
  end
  def name
    "AlternatePlayer"
  end
  def play
    if @last_action == Cooperate
      Defect
    else
      Cooperate
    end
  end
  def update(my_action, op_action)
    @last_action = my_action
  end
end

class TitForTatPlayer < Player
  def initialize
    @last_op_action = Cooperate
  end
  def name
    "TitForTatPlayer"
  end
  def play
    if @last_op_action == Defect
      Defect
    else
      Cooperate
    end
  end
  def update(my_action, op_action)
    @last_op_action = op_action
  end
end
