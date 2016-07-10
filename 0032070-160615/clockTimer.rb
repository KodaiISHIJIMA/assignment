# coding: utf-8
load('./observerPattern.rb')

class ClockTimer < Subject
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
    # 59secではないとき
    if @second < 59
      @second += 1
    # 59secのときは0secにして1min進める
    else
      # 59minではないとき
      if @minute < 59
        @second = 0
        @minute += 1
      # 59minのときは0sec,0minにして1hour進める
      else
        @second = 0
        @minute = 0
        @hour = (@hour+1)%24
      end
    end
    notify()
  end
end
