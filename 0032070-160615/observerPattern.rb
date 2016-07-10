class Observer
  def update
  end
end

class Subject
  attr_reader :observer
  def initialize
    @observers = []
  end
  def attach(observer)
    @observers << observer
  end
  def detach(observer)
    @observers.delete(observer)
  end
  def notify
    @observers.each{|o| o.update}
  end
end

# result
# irb(main):026:0> timer = ClockTimer.new(22, 54, 13)
# timer = ClockTimer.new(22, 54, 13)
# => #<ClockTimer:0x007ff0b08a01f8 @observers=[], @hour=22, @minute=54, @second=13>
# irb(main):027:0> cc1 = ConsoleClock.new(timer)
# cc1 = ConsoleClock.new(timer)
# => #<ConsoleClock:0x007ff0b08a8218 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[#<ConsoleClock:0x007ff0b08a8218 ...>], @hour=22, @minute=54, @second=13>>
# irb(main):028:0> cc2 = ConsoleClock.new(timer)
# cc2 = ConsoleClock.new(timer)
# => #<ConsoleClock:0x007ff0b1334178 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[#<ConsoleClock:0x007ff0b08a8218 @subject=#<ClockTimer:0x007ff0b08a01f8 ...>>, #<ConsoleClock:0x007ff0b1334178 ...>], @hour=22, @minute=54, @second=13>>
# irb(main):029:0> cc3 = ConsoleClock.new(timer)
# cc3 = ConsoleClock.new(timer)
# => #<ConsoleClock:0x007ff0b08b0030 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[#<ConsoleClock:0x007ff0b08a8218 @subject=#<ClockTimer:0x007ff0b08a01f8 ...>>, #<ConsoleClock:0x007ff0b1334178 @subject=#<ClockTimer:0x007ff0b08a01f8 ...>>, #<ConsoleClock:0x007ff0b08b0030 ...>], @hour=22, @minute=54, @second=13>>
# irb(main):030:0> timer.tick()
# timer.tick()
# 22:54:14
# 22:54:14
# 22:54:14
# => [#<ConsoleClock:0x007ff0b08a8218 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[...], @hour=22, @minute=54, @second=14>>, #<ConsoleClock:0x007ff0b1334178 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[...], @hour=22, @minute=54, @second=14>>, #<ConsoleClock:0x007ff0b08b0030 @subject=#<ClockTimer:0x007ff0b08a01f8 @observers=[...], @hour=22, @minute=54, @second=14>>]
