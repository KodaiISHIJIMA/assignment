# coding: utf-8
load('./observerPattern.rb')

class DownClockTimer < Subject
  attr_reader :hour, :minute, :second
  # 初期時刻を設定する
  def initialize(initial_hour, initial_minute, initial_second)
    # ここでsuperを呼ばないと配列@observerが初期化されてなくてattachで追加できない
    super()
    @hour = initial_hour
    @minute = initial_minute
    @second = initial_second
  end
  # 1sec進める
  def tick
    # not 0sec
    if @second > 0
      @second -= 1
    # 0sec
    else
      # 0sec not 0min
      if @minute > 0
        @second = 59
        @minute -= 1
      # 0sec 0min
      else
        # 0sec 0min not 0hour
        if @hour > 0
          @second = 59
          @minute = 59
          @hour -= 1
        # 0sec 0min 0hour
        else
          "TIME OVER"
        end
      end
    end
    notify()
  end
end
