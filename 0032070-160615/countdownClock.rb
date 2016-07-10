# coding: utf-8
load('./observerPattern.rb')

class CountdownClock < Observer
  def initialize(subject)
    super()
    @subject = subject
    @subject.attach(self)
  end
  def clock_to_string(clock)
    if clock.hour == 0 and clock.minute == 0 and clock.second == 0
      "!!!"
    else
      sprintf("%02d:%02d:%02d", clock.hour, clock.minute, clock.second)
    end
  end
  def update
    puts clock_to_string(@subject)
  end
end

# result
# timer = DownClockTimer.new(0, 0, 3)
# => #<DownClockTimer:0x007fc35b1e3a90 @observers=[], @hour=0, @minute=0, @second=3>
# irb(main):013:0> cd = CountdownClock.new(timer)
# cd = CountdownClock.new(timer)
# => #<CountdownClock:0x007fc35a0fada0 @subject=#<DownClockTimer:0x007fc35b1e3a90 @observers=[#<CountdownClock:0x007fc35a0fada0 ...>], @hour=0, @minute=0, @second=3>>
# irb(main):014:0> timer.tick()
# timer.tick()
# 00:00:02
# => [#<CountdownClock:0x007fc35a0fada0 @subject=#<DownClockTimer:0x007fc35b1e3a90 @observers=[...], @hour=0, @minute=0, @second=2>>]
# irb(main):015:0> timer.tick()
# timer.tick()
# 00:00:01
# => [#<CountdownClock:0x007fc35a0fada0 @subject=#<DownClockTimer:0x007fc35b1e3a90 @observers=[...], @hour=0, @minute=0, @second=1>>]
# irb(main):016:0> timer.tick()
# timer.tick()
# !!!
# => [#<CountdownClock:0x007fc35a0fada0 @subject=#<DownClockTimer:0x007fc35b1e3a90 @observers=[...], @hour=0, @minute=0, @second=0>>]
