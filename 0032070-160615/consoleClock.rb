# coding: utf-8
load('./observerPattern.rb')

class ConsoleClock < Observer
  def initialize(subject)
    super()
    @subject = subject
    @subject.attach(self)
  end
  def clock_to_string(clock)
    sprintf("%02d:%02d:%02d", clock.hour, clock.minute, clock.second)
  end
  def update
    puts clock_to_string(@subject)
  end
end
